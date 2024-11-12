package com.ict.manager.seller.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.seller.service.SellerService;
import com.ict.manager.seller.vo.ManagerSellerVO;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;

	@GetMapping("/seller_list")
	public ModelAndView ManagerList(@RequestParam(defaultValue = "1") int page) {
		// 열 개수 정해놓고 페이지도 1이 default
		int size = 10;
		int offset = (page - 1) * size;

		ModelAndView mv = new ModelAndView("manager/seller/seller_list");
		List<ManagerSellerVO> seller_list = sellerService.getSellerList(page, size);

		int totalsellers = sellerService.getSellerCount();
		int totalPages = (int) Math.ceil((double) totalsellers / size);

		mv.addObject("seller_list", seller_list);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);

		return mv;
	}

	@GetMapping("/seller_detail")
	public ModelAndView ManagerDetail(@RequestParam("sellers_idx") String seller_idx) {
		ModelAndView mv = new ModelAndView("manager/seller/seller_onelist");
		ManagerSellerVO msvo = sellerService.getSellerDetail(seller_idx);
		
		
		if (msvo != null) {
			mv.addObject("msvo", msvo);
			return mv;
		}
		System.out.println("여기는 컨트롤러 에러");
		return new ModelAndView("manager/error");
	}


	@PostMapping("/seller_delete_ok")
	public ModelAndView ManagerDeleteOK(ManagerSellerVO msvo) {
		ModelAndView mv = new ModelAndView();

		// 사용자를 삭제합니다
		int result = sellerService.getSellerDelete(msvo.getSellers_idx());
		if (result > 0) {
			mv.setViewName("redirect:/seller_list");
			return mv;
		}

		return new ModelAndView("seller/delete");
	}

	@PostMapping("/seller_update")
	public ModelAndView ManagerUpdate(@RequestParam("sellers_idx") String seller_idx) {
		ModelAndView mv = new ModelAndView("manager/seller/seller_update");
		ManagerSellerVO msvo = sellerService.getSellerDetail(seller_idx);
		if (msvo != null) {
			mv.addObject("msvo", msvo);
			return mv;
		}
		return new ModelAndView("manager/error");
	}

	@PostMapping("/seller_update_ok")
	public ModelAndView ManagerUpdateOK(@RequestParam("sellers_idx") String sellerId, ManagerSellerVO msvo,
			HttpServletRequest request) {
		msvo.setSellers_idx(sellerId);
		ModelAndView mv = new ModelAndView();
		try {
			int result = sellerService.getSellerUpdate(msvo);
			if (result > 0) {
				mv.setViewName("redirect:/seller_detail?seller_idx=" + msvo.getSellers_idx());
				return mv;
			}

			System.out.println("값이 안들어갔음");

			return new ModelAndView("manager/error");

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}

	}

	@GetMapping("/seller_search")
	public ModelAndView searchsellers(
	        @RequestParam(value = "keyword", required = false) String keyword,
	        @RequestParam(defaultValue = "1") int page) {
	    // System.out.println(keyword); 얘는 잘 넘어옴..
	    int size = 10; // 페이지당 항목 수
	    int offset = (page - 1) * size; // 검색 결과에 적용할 오프셋
	    
	    List<ManagerSellerVO> sellerList;
	    int totalsellers;
	    
	    if (keyword != null && !keyword.isEmpty()) {
	        sellerList = sellerService.getSearchSeller(keyword, page, size); // 검색어와 페이지네이션을 반영한 검색 로직
	        System.out.println(sellerList);
	        totalsellers = sellerService.getSearchSellerCount(keyword); // 검색어에 따른 총 사용자 수
	    } else {
	        sellerList = sellerService.getSellerList(page, size); // 전체 사용자 목록
	        totalsellers = sellerService.getSellerCount();
	    }
	    
	    int totalPages = (int) Math.ceil((double) totalsellers / size);
	    
	    ModelAndView mv = new ModelAndView("manager/seller/seller_list");
	    mv.addObject("seller_list", sellerList);
	    mv.addObject("currentPage", page);
	    mv.addObject("totalPages", totalPages);

	    return mv;
	}

}
