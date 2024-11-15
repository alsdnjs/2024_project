package com.ict.userrank.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.userrank.service.UserrankService;
import com.ict.userrank.vo.UserrankVO;

@Controller
public class UserrankController {
	
	@Autowired
	private UserrankService userrankService;
	
	@GetMapping("/getUserRank")
    @ResponseBody
    public Map<String, String> getUserRank(HttpSession session) {
        String userId = (String) session.getAttribute("user_id");
        System.out.println("Debug: userId = " + userId);  // 세션 user_id 확인

        String userRank = "FAMILY";  // 기본 값 설정
        
        if (userId != null) {
            UserrankVO user = userrankService.getUserById(userId); 
            userRank = user != null ? user.getUserrank() : "정보 없음";
            System.out.println("userRank = " + userRank);  // 조회한 user_rank 확인
        } else {
            System.out.println("로그인하세요");
            userRank = "로그인 필요";
        }

        Map<String, String> result = new HashMap<>();
        result.put("user_rank", userRank);
        return result;
    }

	
}
