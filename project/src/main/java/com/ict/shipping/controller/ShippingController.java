package com.ict.shipping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
        // System.out.println("Session: " + (session != null));
        ModelAndView mv = new ModelAndView("mypage/orderHistory");
        // System.out.println("ModelAndView: " + (mv != null));

        // 세션에서 주문 ID를 가져온다.
        Integer user_idx = (Integer) session.getAttribute("user_idx");
        //  int user_idx = 41;
        
        if (user_idx == 0) {
            // 테스트용으로 임시 값 설정
        	user_idx = 41; // 존재하는 주문 ID 값으로 설정
            session.setAttribute("user_idx", user_idx);
        }
        // System.out.println("user_idx : " + user_idx);
        
            // 전체 배송 내역 수를 구하기
            int count = shippingService.getTotalCount(user_idx);
            paging.setTotalRecord(count);

            // 페이지 수 계산
            if (paging.getTotalRecord() <= paging.getNumPerPage()) {
                paging.setTotalPage(1);
            } else {
                paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
                if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
                    paging.setTotalPage(paging.getTotalPage() + 1);
                }
            }

            // 현재 페이지 설정
            String cPage = request.getParameter("cPage");
            if (cPage == null) {
                paging.setNowPage(1);
            } else {
                paging.setNowPage(Integer.parseInt(cPage));
            }

            // offset 계산
            paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

            // 시작블록과 끝블록 설정
            paging.setBeginBlock(
                    (int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
            paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

            if (paging.getEndBlock() > paging.getTotalPage()) {
                paging.setEndBlock(paging.getTotalPage());
            }

            // DB에서 페이징 처리된 배송 내역 가져오기
            List<ShippingVO> olist = shippingService.getShippingList(user_idx, paging.getOffset(), paging.getNumPerPage());
            // System.out.println("list size: " + list.size());  // 리스트의 크기 출력
            // 뷰에 데이터 추가
            mv.addObject("olist", olist);
            mv.addObject("paging", paging);

        return mv;
    }
    
   

    
}
