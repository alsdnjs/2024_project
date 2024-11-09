package com.ict.shipping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.shipping.service.ShippingService;
import com.ict.shipping.vo.ShippingVO;

@Controller
public class ShippingController {

	@Autowired
	private ShippingService shippingService;

	@Autowired
	private Paging paging;

	@RequestMapping("/orderHistory")
	public ModelAndView getShippingList(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    ModelAndView mv = new ModelAndView("mypage/orderHistory");

	    // 세션에서 user_id 가져오기
	    String user_id = (String) session.getAttribute("user_id");
	    if (user_id == null) {
	        mv.addObject("error", "로그인이 필요합니다.");
	        mv.setViewName("redirect:/user_login");
	        return mv;
	    }

	    // 전체 배송 내역 수 조회 및 페이징 설정
	    int count = shippingService.getTotalCount(user_id);
	    paging.setTotalRecord(count);
	    paging.setTotalPage((int) Math.ceil((double) count / paging.getNumPerPage()));
	    
	    // 현재 페이지 설정
	    String cPage = request.getParameter("cPage");
	    paging.setNowPage(cPage == null ? 1 : Integer.parseInt(cPage));
	    
	    // Offset 계산
	    paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));
	    
	    // 블록 계산
	    int beginBlock = (paging.getNowPage() - 1) / paging.getPagePerBlock() * paging.getPagePerBlock() + 1;
	    int endBlock = Math.min(beginBlock + paging.getPagePerBlock() - 1, paging.getTotalPage());
	    paging.setBeginBlock(beginBlock);
	    paging.setEndBlock(endBlock);

	    // DB에서 페이징 처리된 배송 내역 가져오기
	    List<ShippingVO> olist = shippingService.getShippingList(user_id, paging.getOffset(), paging.getNumPerPage());
	       
	    // Debugging 코드: olist가 비어 있는지 확인
	    System.out.println("Debug: 주문 내역 리스트 사이즈 = " + (olist != null ? olist.size() : "olist가 null입니다."));
	    
	    mv.addObject("olist", olist);
	    mv.addObject("paging", paging);

	    return mv;
	}


	@RequestMapping("/mypage")
	public ModelAndView getMypage(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    ModelAndView mv = new ModelAndView("mypage/mypage");

	    // 세션에서 user_idx 가져오기
	    String user_id = (String) session.getAttribute("user_id");
	    System.out.println("Debug: user_idx from session = " + user_id);  // user_idx 값 확인

	    // shippingService가 null인지 확인
	    if (shippingService == null) {
	        System.out.println("Error: shippingService is null.");  // shippingService null 확인
	        mv.addObject("error", "서비스가 초기화되지 않았습니다.");
	        return mv;
	    } else {
	        System.out.println("Debug: shippingService is initialized");  // shippingService 정상 확인
	    }

	    // 주문 내역 가져오기
	    List<ShippingVO> clist = null;
	    try {
	        System.out.println("Debug: Attempting to retrieve order count for user_id = " + user_id);
	        clist = shippingService.getOrderCount(user_id);

	        // clist가 null인지 확인
	        if (clist == null) {
	            System.out.println("Error: clist is null.");  // clist null 확인
	            mv.addObject("error", "유효한 주문 내역이 없습니다.");
	        } else if (clist.isEmpty()) {
	            System.out.println("Debug: clist is empty");  // clist가 빈 리스트일 때
	            mv.addObject("error", "주문 내역이 없습니다.");
	        } else {
	            System.out.println("Debug: clist retrieved successfully, size = " + clist.size());  // clist 크기 확인
	            mv.addObject("clist", clist);
	        }
	    } catch (Exception e) {
	        System.out.println("Error: Exception occurred while retrieving order count.");
	        e.printStackTrace();
	        mv.addObject("error", "주문 내역을 가져오는 중 오류가 발생했습니다.");
	    }

	    return mv;
	}


}
