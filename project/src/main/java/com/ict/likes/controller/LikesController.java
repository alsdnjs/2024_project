package com.ict.likes.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.likes.service.LikesService;
import com.ict.likes.vo.LikesVO;

@Controller
public class LikesController {
	
	@Autowired
	private LikesService likesService;
	
	@GetMapping("/getLikes")
	@ResponseBody
	public List<LikesVO> getLikesList(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    String user_id = (String) session.getAttribute("user_id"); // 세션에서 `user_id` 가져오기
	    
	    if (user_id == null) {
	        return new ArrayList<>(); // 로그인되지 않은 경우 빈 리스트 반환
	    }
	    return likesService.getLikesList(user_id);
	}
	

	
}
