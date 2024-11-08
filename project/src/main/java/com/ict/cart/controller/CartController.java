package com.ict.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.cart.service.CartService;
import com.ict.cart.vo.CartVO;
import com.ict.member.vo.MemberVO;


@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("/cart_list")
	public ModelAndView cartList(HttpSession session) {
		
		try {
			ModelAndView mv = new ModelAndView("cart/cart_list");
			
			// 세션을 통해 로그인 정보 확인
			MemberVO loginStatus = (MemberVO) session.getAttribute("userInfo");
			 System.out.println("userInfo 세션에서 가져온 값: " + loginStatus);
			System.out.println(loginStatus);
	    	// mvo가 null인지 확인 (로그인되지 않은 경우)
	    	if (loginStatus == null) {
	    		System.out.println("null이라 실패");
	    		// 로그인 페이지로 이동
	    		return new ModelAndView("login/login");
	    	}
	    	// mvo 객체에서 user_idx 가져오기
	    	String user_idx = (loginStatus.getUser_idx());
	    	System.out.println("user_idx : " + user_idx);
			
			List<CartVO> cart_list = cartService.getCartList(user_idx);
			mv.addObject("cart_list", cart_list);
			return mv;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}