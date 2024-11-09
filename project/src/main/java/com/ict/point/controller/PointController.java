package com.ict.point.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.point.service.PointService;
import com.ict.point.vo.PointVO;

@Controller
public class PointController {
	
	@Autowired
	private PointService pointService;
	
	@GetMapping("/getpoint")
	@ResponseBody
	public List<PointVO> getPointList(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		String user_id = (String) session.getAttribute("user_id");

		if (user_id == null) {
			 return new ArrayList<>(); // 로그인되지 않은 경우 빈 리스트 반환
	    }
	    return pointService.getPointList(user_id);
	}
	
}
