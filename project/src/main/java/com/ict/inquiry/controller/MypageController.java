package com.ict.inquiry.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	@RequestMapping("/firstin")
	public ModelAndView firstin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("day01/mypage0");
		return mv;
	}
	@RequestMapping("/mypage0")
	public ModelAndView firstin0() {
		return new ModelAndView("day01/mypage0");
	}
	@RequestMapping("/orderHistory0")
	public ModelAndView firstin1() {
		return new ModelAndView("day01/orderHistory0");
	}
	@RequestMapping("/updateProfile0")
	public ModelAndView firstin2() {
		return new ModelAndView("day01/updateProfile0");
	}
	@RequestMapping("/myInquiry0")
	public ModelAndView firstin3() {
		return new ModelAndView("day01/myInquiry0");
	}
	@RequestMapping("/writeInquiry0")
	public ModelAndView firstin4() {
		return new ModelAndView("day01/writeInquiry0");
	}
	@RequestMapping("/like")
	public ModelAndView firstin5() {
		return new ModelAndView("day01/like");
	}
	@RequestMapping("/coin")
	public ModelAndView firstin6() {
		return new ModelAndView("day01/coin");
	}
	@RequestMapping("/grade")
	public ModelAndView firstin7() {
		return new ModelAndView("day01/grade");
	}
	

	
}
