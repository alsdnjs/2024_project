package com.ict.mypage.inquiry.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.inquiry.service.InquiryService;
import com.ict.member.vo.MemberVO;



@Controller
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	
	
	@Value("${file.upload-dir}") // jdbc.properties에서 파일 경로 주입
	private String uploadDir;

	@RequestMapping("/prac")
	public ModelAndView firstin0() {
		return new ModelAndView("mypage/mypage");
	}

	@RequestMapping("/mypage")
	public ModelAndView firstin02() {
		return new ModelAndView("mypage/mypage");
	}


	@RequestMapping("/updateProfile")
	public ModelAndView getUpdateProfile() {
		return new ModelAndView("mypage/updateProfile");
	}
	
	// 회원 정보 수정
	@PostMapping("/updateMemberInfo")
	public ModelAndView updateMemberInfo(@ModelAttribute MemberVO memberVO, HttpSession session) {
	    ModelAndView mv = new ModelAndView();

	    MemberVO loggedInUser = (MemberVO) session.getAttribute("userInfo");
	    if (loggedInUser == null) {
	        mv.addObject("alertMessage", "로그인이 필요합니다.");
	        mv.setViewName("loginform2222");
	        return mv;
	    }

	    try {
	        // 로그인된 사용자의 user_idx 설정
	        memberVO.setUser_idx(loggedInUser.getUser_idx());

	        // 비밀번호 변경 요청이 있는지 확인하고 암호화
	        if (memberVO.getPassword() != null && !memberVO.getPassword().isEmpty()) {
	            String encryptedPassword = passwordEncoder.encode(memberVO.getPassword());
	            memberVO.setPassword(encryptedPassword);
	        } else {
	            // 비밀번호 변경이 없으면 기존 비밀번호 유지
	            memberVO.setPassword(loggedInUser.getPassword());
	        }

	        int result = inquiryService.updateMemberInfo(memberVO);
	        System.out.println("updateMemberInfo 결과: " + result);

	        if (result > 0) {
	            session.setAttribute("userInfo", memberVO); // 세션 갱신
	            mv.addObject("alertMessage", "회원 정보가 성공적으로 수정되었습니다.");
	            mv.setViewName("redirect:/mypage");
	        } else {
	            mv.addObject("alertMessage", "회원 정보 수정에 실패했습니다.");
	            mv.setViewName("day02/updateProfile");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        mv.addObject("alertMessage", "회원 정보 수정 중 오류가 발생했습니다.");
	        mv.setViewName("errorPage");
	    }

	    return mv;
	}
	
	


	@RequestMapping("/update")
	public ModelAndView getupdate() {
		return new ModelAndView("mypage/update");
	}

	@RequestMapping("/membership")
	public ModelAndView getmembership() {
		return new ModelAndView("mypage/membership");
	}

	
}
