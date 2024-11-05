package com.ict.email.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.ict.email.service.EmailService;

	@RestController
	public class EmailController {

	@Autowired
	private EmailService emailService; // 이메일 서비스 주입

	// 이메일 인증번호 전송
	 @PostMapping("/send_email_code")
	    public Map<String, String> sendMail(@RequestParam("userMail") String userMail, HttpServletRequest request) {
	        Map<String, String> response = new HashMap<>();
	        try {
	            // 임시번호 6자리 만들기
	            Random random = new Random();
	            String ranNum = String.format("%06d", random.nextInt(1000000));

	            // 임시번호 서버에 출력
	            System.out.println("임시번호: " + ranNum);

	            // 세션에 저장하기
	            request.getSession().setAttribute("emailCode", ranNum);

	            // EmailService 호출해서 사용하기
	            emailService.sendEmail(ranNum, userMail);

	            response.put("status", "success");
	            response.put("message", "인증번호가 전송되었습니다.");
	        } catch (Exception e) {
	            System.out.println(e);
	            response.put("status", "fail");
	            response.put("message", "이메일 전송에 실패했습니다.");
	        }
	        return response;
	    }

	// 이메일 인증번호 확인
	@PostMapping("/judge_code_match")
	public Map<String, String> checkAuthNum(@RequestParam("authNumber") String authNumber, HttpServletRequest request) {
		Map<String, String> response = new HashMap<>();
		String emailCode = (String) request.getSession().getAttribute("emailCode");
		if (emailCode != null && emailCode.equals(authNumber)) {
			response.put("status", "success");
			response.put("message", "인증번호가 일치합니다.");
			request.getSession().removeAttribute("emailCode"); // 인증 성공 시 세션에서 인증 코드 삭제
		} else {
			response.put("status", "fail");
			response.put("message", "인증번호가 일치하지 않습니다.");
		}
		return response;
	}
}