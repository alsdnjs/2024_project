package com.ict.mypage.seller.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.seller.service.SellerService;
import com.ict.manager.seller.vo.ManagerSellerVO;
import com.ict.manager.user.service.UserService;
import com.ict.manager.user.vo.ManagerUserVO;
import com.ict.mypage.seller.service.MypageSellerProfileService;
import com.ict.mypage.seller.vo.MypageSellerProfileVO;

@Controller
public class MypageSellerController {
	@Autowired
	private UserService userService;
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private MypageSellerProfileService mypageSellerService;
	
	 @Autowired
	    private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/sellerProfileChk")
	public ModelAndView sellerProfile(HttpServletRequest request) {
		// 주석
		HttpSession session = request.getSession();
		 String userId = (String) session.getAttribute("user_id");
		
		ManagerUserVO userInfo = userService.getUserDetail(userId);
		ModelAndView mv = new ModelAndView("seller/sellerProfileChk");
		
		if (userInfo != null) {
			mv.addObject("user_id", userInfo.getUser_id());
			mv.addObject("username", userInfo.getUsername());
		}
		return mv;
	}
	
	@RequestMapping("/sellerinquiry")
	public ModelAndView firstin2() {
		return new ModelAndView("seller/sellerInquiry");
	}
	
	// 업데이트 화면
	@RequestMapping("/seller_profile_detail")
	public ModelAndView SellerUpdateLogin(HttpServletRequest request, String password) {
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("user_id");

	    // seller 정보 가져오기
	    ManagerSellerVO sellerInfo = sellerService.getSellerDetail2(userId);
	    ModelAndView mv = new ModelAndView("seller/sellerProfile");

	    if (sellerInfo != null) {
	        mv.addObject("seller_idx", sellerInfo.getSellers_idx());
	        mv.addObject("store_name", sellerInfo.getStore_name());
	        mv.addObject("store_description", sellerInfo.getStore_description());
	        mv.addObject("contact_number", sellerInfo.getContact_number());
	        mv.addObject("seller_rep_name", sellerInfo.getSeller_rep_name());
	    }

	    // DB에서 암호화된 비밀번호 가져오기
	    String storedPassword = mypageSellerService.SellerProfileUpdate(userId);
	    System.out.println("Stored Password: " + storedPassword);

	    // 비밀번호 검사
	    if (passwordEncoder.matches(password, storedPassword)) {
	        return mv;
	    } else {
	        mv = new ModelAndView("seller/sellerProfileChk");
	        mv.addObject("message", "비밀번호가 올바르지 않습니다.");
	        return mv;
	    }
	}

	
	@PostMapping("/seller_profile_update")
	public ModelAndView SellerUpdate(@RequestParam("seller_idx") String seller_idx) {
		ModelAndView mv = new ModelAndView("seller/sellerProfileUpdate");
		ManagerSellerVO sellerInfo = sellerService.getSellerDetail(seller_idx);
		if (sellerInfo != null) {
			mv.addObject("seller_idx", sellerInfo.getSellers_idx());
			mv.addObject("store_name", sellerInfo.getStore_name());
			mv.addObject("store_description", sellerInfo.getStore_description());
			mv.addObject("contact_number", sellerInfo.getContact_number());
			mv.addObject("seller_rep_name", sellerInfo.getSeller_rep_name());
			return mv;
		}
		mv.setViewName("manager/error");
		return mv;
	}
	
	
	@PostMapping("/seller_profile_update_ok")
	public ModelAndView SellerUpdateOK(@RequestParam("seller_idx") String seller_idx, MypageSellerProfileVO mspvo,
			HttpServletRequest request) {
		mspvo.setSellers_idx(seller_idx);
		ModelAndView mv = new ModelAndView();
		try {
			int result = mypageSellerService.getSellerProfileUpdateOK(mspvo);
			if (result > 0) {
				mv.setViewName("redirect:/sellerProfileChk");
				return mv;
			}
		} catch (Exception e) {
			System.out.println("업데이트에 문제있음");
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}
		System.out.println("무언가 심각하게 잘못됨");
		return new ModelAndView("manager/error");
	}
	
	
	
}
