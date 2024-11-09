package com.ict.like.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ict.like.service.LikeService;


@RestController
public class LikeController {
	
	@Autowired
	private LikeService likeService;
	
	@PostMapping("/add_like")
	public ResponseEntity<String> addLike(
			@RequestParam("product_idx") int product_idx,
			HttpSession session) {
		
		try {
	        // 세션에서 user_idx를 String으로 가져오기
	        String user_idx_str = (String) session.getAttribute("user_idx");

	        // user_idx가 null이거나 비어있는 경우 처리
	        if (user_idx_str == null || user_idx_str.isEmpty()) {
	            System.out.println("좋아요를 넣는게 null이라 실패");
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null); // 로그인되지 않음
	        }

	        // String을 Integer로 변환
	        Integer user_idx = Integer.parseInt(user_idx_str); 

	        // mvo 객체에서 user_idx 가져오기
	        System.out.println("user_idx : " + user_idx);
	        System.out.println("product_idx : " + product_idx);

	        // DB 처리 로직 (예: 좋아요 추가)
	        int result = likeService.addLike(product_idx, user_idx);
	        System.out.println(result);
	        return ResponseEntity.ok("Like added successfully!");
	    } catch (Exception e) {
	        System.out.println(e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body("Failed to add like");
	    }
	}
	@PostMapping("/remove_like")
	public ResponseEntity<String> removeLike(
			@RequestParam("product_idx") int product_idx,
			HttpSession session) {
		
		try {
			// 세션에 로그인 내용 있는지 확인
			String user_idx_str = (String) session.getAttribute("user_idx");
	    	// mvo가 null인지 확인 (로그인되지 않은 경우)
	    	if (user_idx_str == null || user_idx_str.isEmpty()) {
	    		System.out.println("좋아요를 빼는게 null이라 실패");
	    		return null;
	    	}
	    	// String을 Integer로 변환
	        Integer user_idx = Integer.parseInt(user_idx_str); 

	    	// mvo 객체에서 user_idx 가져오기
	    	System.out.println("user_idx : " + user_idx);
	    	
			// DB 처리 로직 (예: 좋아요 추가)
			likeService.removeLike(product_idx, user_idx);
			return ResponseEntity.ok("Like deleted successfully!");
		} catch (Exception e) {
			// 오류 발생 시 500 상태 코드와 메시지 반환
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Failed to delete like");
		}
	}
	
	@GetMapping("/get_product_likes")
	public List<Integer> getProductLikes(HttpSession session){
		try {
			String user_idx_str = (String) session.getAttribute("user_idx");
	    	// mvo가 null인지 확인 (로그인되지 않은 경우)
	    	if (user_idx_str == null || user_idx_str.isEmpty()) {
	    		System.out.println("좋아요를 불러오기가 null이라 실패");
	    		return null;
	    	}
	    	// String을 Integer로 변환
	        Integer user_idx = Integer.parseInt(user_idx_str); 

	    	// mvo 객체에서 user_idx 가져오기
	    	System.out.println("user_idx : " + user_idx);
	    	List<Integer> list = likeService.checkUsersLikes(user_idx);
	    	
	    	System.out.println("list : " + list);
	    	return list;
	    	
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}