package com.ict.manager.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.order.service.OrderService;
import com.ict.manager.order.vo.ManagerOrderVO;


@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@GetMapping("/order_list")
	public ModelAndView OrderList(@RequestParam(defaultValue = "1") int page) {
		// 열 개수 정해놓고 페이지도 1이 default
		int size = 10;
		int offset = (page - 1) * size;

		ModelAndView mv = new ModelAndView("manager/order/order_list");
		List<ManagerOrderVO> order_list = orderService.getOrderList(page, size);

		int totalorders = orderService.getOrderCount();
		int totalPages = (int) Math.ceil((double) totalorders / size);

		mv.addObject("order_list", order_list);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);

		return mv;
	}


	@GetMapping("/order_detail")
	public ModelAndView OrderDetail(@RequestParam("orders_idx") String orders_idx) {
		ModelAndView mv = new ModelAndView("manager/order/order_onelist");
		ManagerOrderVO movo = orderService.getOrderDetail(orders_idx);
		
		if (movo != null) {
			mv.addObject("movo", movo);		
			return mv;
		}
		System.out.println("여기는 컨트롤러 에러");
		return new ModelAndView("manager/error");
	}


	@PostMapping("/order_delete_ok")
	public ModelAndView ManagerDeleteOK(@RequestParam("orders_idx") String orders_idx,ManagerOrderVO movo) {
		ModelAndView mv = new ModelAndView();
		movo.setOrders_idx(orders_idx);
		// 사용자를 삭제합니다.
		
		int result = orderService.getOrderDelete(movo.getOrders_idx());
		if (result > 0) {
			mv.setViewName("redirect:/order_list");
			return mv;
		}

		return new ModelAndView("manager/error");
	}

	
	@GetMapping("/order_search")
	public ModelAndView searchorders(
	        @RequestParam(value = "keyword", required = false) String keyword,
	        @RequestParam(defaultValue = "1") int page) {
	 
	    int size = 10; // 페이지당 항목 수
	    int offset = (page - 1) * size; // 검색 결과에 적용할 오프셋
	    
	    List<ManagerOrderVO> orderList;
	    int totalorders;
	    
	    if (keyword != null && !keyword.isEmpty()) {
	        orderList = orderService.getSearchOrder(keyword, page, size); // 검색어와 페이지네이션을 반영한 검색 로직
	        System.out.println(orderList);
	        totalorders = orderService.getSearchOrderCount(keyword); // 검색어에 따른 총 사용자 수
	    } else {
	        orderList = orderService.getOrderList(page, size); // 전체 사용자 목록
	        totalorders = orderService.getOrderCount();
	    }
	    
	    int totalPages = (int) Math.ceil((double) totalorders / size);
	    
	    ModelAndView mv = new ModelAndView("manager/order/order_list");
	    mv.addObject("order_list", orderList);
	    mv.addObject("currentPage", page);
	    mv.addObject("totalPages", totalPages);

	    return mv;
	}

}
