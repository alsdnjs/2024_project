package com.ict.manager.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.user.service.UserService;
import com.ict.manager.user.vo.ManagerUserVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/user_list")
	public ModelAndView ManagerList(@RequestParam(defaultValue = "1") int page) {
		// 열 개수 정해놓고 페이지도 1이 default
		int size = 10;
		int offset = (page - 1) * size;

		ModelAndView mv = new ModelAndView("user/user_list");
		List<ManagerUserVO> user_list = userService.getUserList(page, size);

		int totalUsers = userService.getUserCount();
		int totalPages = (int) Math.ceil((double) totalUsers / size);

		mv.addObject("user_list", user_list);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);

		return mv;
	}

	@GetMapping("/user_write")
	public ModelAndView ManagerWrite() {
		return new ModelAndView("user/user_write");
	}

	@GetMapping("/user_detail")
	public ModelAndView ManagerDetail(@RequestParam("user_id") String user_id) {
		ModelAndView mv = new ModelAndView("user/user_onelist");
		ManagerUserVO uvo = userService.getUserDetail(user_id);
		
		// 제재여부 매니저 아이디가 들어가있으면 yes 아니면 no
		String warnStatus = "";
		if (uvo != null) {
			if (uvo.getWarned_user() != null) {
				warnStatus = "yes";
			} else {
				warnStatus = "no";
			}
			mv.addObject("uvo", uvo);
			mv.addObject("warnStatus", warnStatus);
			return mv;
		}
		System.out.println("여기는 컨트롤러 에러");
		return new ModelAndView("manager/error");
	}

	@PostMapping("/user_write_ok")
	public ModelAndView ManagerWriteOk(ManagerUserVO uvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/user_list");
			int result = userService.getUserInsert(uvo);
			if (result > 0) {
				return mv;
			}

			return new ModelAndView("manager/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}

	}

	@PostMapping("/user_delete_ok")
	public ModelAndView ManagerDeleteOK(ManagerUserVO uvo) {
		ModelAndView mv = new ModelAndView();

		// 사용자를 삭제합니다
		int result = userService.getUserDelete(uvo.getUser_id());
		if (result > 0) {
			mv.setViewName("redirect:/user_list");
			return mv;
		}

		return new ModelAndView("user/delete");
	}

	@PostMapping("/user_update")
	public ModelAndView ManagerUpdate(@RequestParam("user_id") String user_id) {
		ModelAndView mv = new ModelAndView("user/user_update");
		ManagerUserVO uvo = userService.getUserDetail(user_id);
		if (uvo != null) {
			mv.addObject("uvo", uvo);
			return mv;
		}
		return new ModelAndView("manager/error");
	}

	@PostMapping("/user_update_ok")
	public ModelAndView ManagerUpdateOK(@RequestParam("user_id") String userId, ManagerUserVO uvo,
			HttpServletRequest request) {
		uvo.setUser_id(userId);
		ModelAndView mv = new ModelAndView();
		try {
			int result = userService.getUserUpdate(uvo);
			if (result > 0) {
				mv.setViewName("redirect:/user_detail?user_id=" + uvo.getUser_id());
				return mv;
			}

			System.out.println("값이 안들어갔음");

			return new ModelAndView("manager/error");

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}

	}

	@PostMapping("/user_warn")
	public ModelAndView UserWarn(@RequestParam("user_id") String user_id) {
		ModelAndView mv = new ModelAndView("user/user_warn");
		ManagerUserVO uvo = userService.getUserDetail(user_id);

		if (uvo != null) {
			mv.addObject("uvo", uvo);
			return mv;
		}
		return new ModelAndView("manager/error");
	}

	@PostMapping("/user_warn_ok")
	public ModelAndView UserWarnOK(@RequestParam("user_id") String userId, ManagerUserVO uvo,
			HttpServletRequest request) {
		uvo.setUser_id(userId);

		String managerId = (String) request.getSession().getAttribute("manager_id");
		uvo.setWarned_user(managerId);

		System.out.println(uvo.getWarned_user());

		ModelAndView mv = new ModelAndView();
		try {
			int result = userService.getUserWarn(uvo);
			if (result > 0) {
				mv.setViewName("redirect:/user_detail?user_id=" + uvo.getUser_id());
				return mv;
			}

			System.out.println("값이 안들어갔음");

			return new ModelAndView("manager/error");

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}

	}
	
	@GetMapping("/user_warn_onelist")
	public ModelAndView WarnedUserDetail(@RequestParam("user_id") String user_id) {
		ModelAndView mv = new ModelAndView("user/user_warn_onelist");
		ManagerUserVO uvo = userService.getUserDetail(user_id);
		
		if (uvo != null) {
			mv.addObject("uvo", uvo);
			return mv;
		}
		System.out.println("여기는 컨트롤러 에러");
		return new ModelAndView("manager/error");
	}
	
	@GetMapping("/user_search")
	public ModelAndView searchUsers(
	        @RequestParam(value = "keyword", required = false) String keyword,
	        @RequestParam(defaultValue = "1") int page) {
	    // System.out.println(keyword); 얘는 잘 넘어옴..
	    int size = 10; // 페이지당 항목 수
	    int offset = (page - 1) * size; // 검색 결과에 적용할 오프셋
	    
	    List<ManagerUserVO> userList;
	    int totalUsers;
	    
	    if (keyword != null && !keyword.isEmpty()) {
	        userList = userService.getSearchUser(keyword, page, size); // 검색어와 페이지네이션을 반영한 검색 로직
	        System.out.println(userList);
	        totalUsers = userService.getSearchUserCount(keyword); // 검색어에 따른 총 사용자 수
	    } else {
	        userList = userService.getUserList(page, size); // 전체 사용자 목록
	        totalUsers = userService.getUserCount();
	    }
	    
	    int totalPages = (int) Math.ceil((double) totalUsers / size);
	    
	    ModelAndView mv = new ModelAndView("user/user_list");
	    mv.addObject("user_list", userList);
	    mv.addObject("currentPage", page);
	    mv.addObject("totalPages", totalPages);

	    return mv;
	}

}
