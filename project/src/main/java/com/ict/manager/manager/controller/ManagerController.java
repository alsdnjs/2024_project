package com.ict.manager.manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.manager.service.ManagerService;
import com.ict.manager.manager.vo.ManagerVO;
import com.ict.manager.user.vo.ManagerUserVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService managerService;

	@GetMapping("/manager_list")
	public ModelAndView ManagerList(@RequestParam(defaultValue = "1") int page) {
		// 열 개수 정해놓고 페이지도 1이 default
		int size = 10;
		int offset = (page-1)*size;
		
		ModelAndView mv = new ModelAndView("manager/manager/manager_super_list");
		List<ManagerVO> manager_list = managerService.getManagerList(page, size);
		int totalManagers = managerService.getManagerCount();
		int totalPages = (int) Math.ceil((double) totalManagers / size);
		
		mv.addObject("manager_list", manager_list);
		mv.addObject("currentPage", page);
	    mv.addObject("totalPages", totalPages);
	    
		return mv;
	}

	@GetMapping("/manager_write")
	public ModelAndView ManagerWrite() {
		return new ModelAndView("manager/manager/manager_write");
	}
	
	@GetMapping("/manager_common")
	public ModelAndView ManagerCommon() {
		return new ModelAndView("manager/manager/manager_common_list");
	}

	@GetMapping("/manager_detail")
	public ModelAndView ManagerDetail(@RequestParam("manager_id") String manager_id) {
		ModelAndView mv = new ModelAndView("manager/manager/manager_onelist");
		ManagerVO mmvo = managerService.getManagerDetail(manager_id);
		if (mmvo != null) {
			mv.addObject("mmvo", mmvo);
			return mv;
		}
		System.out.println("여기는 컨트롤러 에러");
		return new ModelAndView("manager/error");
	}

	@PostMapping("/manager_write_ok")
	public ModelAndView ManagerWriteOk(ManagerVO mmvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/manager_list");
			int result = managerService.getManagerInsert(mmvo);
			if (result > 0) {
				return mv;
			}

			return new ModelAndView("manager/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}

	}

	@PostMapping("/manager_delete")
	public ModelAndView ManagerDelete(@ModelAttribute("manager_id") String manager_id) {
		return new ModelAndView("manager/manager/manager_delete");
	}

	@PostMapping("/manager_delete_ok")
	public ModelAndView ManagerDeleteOK(ManagerVO mmvo) {
		ModelAndView mv = new ModelAndView();

		// 비밀번호가 맞는지 검사
		ManagerVO mmvo2 = managerService.getManagerDetail(mmvo.getManager_id());
		
		String pw = mmvo.getManager_pw();
		String pw2 = mmvo2.getManager_pw();

		if (pw.equals(pw2)) {
			int result = managerService.getManagerDelete(mmvo.getManager_id());
			if (result > 0) {
				mv.setViewName("redirect:/manager_list");
				return mv;
			}
		} else {
			mv.setViewName("manager/manager/manager_delete");
			mv.addObject("pwdchk", "fail");
			mv.addObject("manager_id", mmvo.getManager_id());
			return mv;
		}
		return new ModelAndView("manager/delete");
	}

	@PostMapping("/manager_update")
	public ModelAndView ManagerUpdate(@RequestParam("manager_id") String manager_id) {
		ModelAndView mv = new ModelAndView("manager/manager/manager_update");
		ManagerVO mmvo = managerService.getManagerDetail(manager_id);
		if (mmvo != null) {
			mv.addObject("mmvo", mmvo);
			return mv;
		}
		return new ModelAndView("manager/error");
	}

	@PostMapping("/manager_update_ok")
	public ModelAndView ManagerUpdateOK(ManagerVO mmvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		try {
			int result = managerService.getManagerUpdate(mmvo);
			System.out.println(mmvo.getManager_id());
			System.out.println(mmvo.getManager_type());
			System.out.println(mmvo.getManager_pw());
			System.out.println(mmvo.getManager_name());
			System.out.println(mmvo.getManager_email());
			if (result > 0) {
				mv.setViewName("redirect:/manager_detail?manager_id=" + mmvo.getManager_id());
				return mv;
			}

			System.out.println("값이 안들어갔음");

			return new ModelAndView("manager/error");

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}

	}
	
	@GetMapping("/manager_search")
	public ModelAndView searchUsers(
	        @RequestParam(value = "keyword", required = false) String keyword,
	        @RequestParam(defaultValue = "1") int page) {
	    // System.out.println(keyword); 얘는 잘 넘어옴..
	    int size = 10; // 페이지당 항목 수
	    int offset = (page - 1) * size; // 검색 결과에 적용할 오프셋
	    
	    List<ManagerVO> managerList;
	    int totalManager;
	    
	    if (keyword != null && !keyword.isEmpty()) {
	        managerList = managerService.getSearchManager(keyword, page, size); // 검색어와 페이지네이션을 반영한 검색 로직
	        totalManager = managerService.getSearchManagerCount(keyword); // 검색어에 따른 총 사용자 수
	    } else {
	        managerList = managerService.getManagerList(page, size); // 전체 사용자 목록
	        totalManager = managerService.getManagerCount();
	    }
	    
	    int totalPages = (int) Math.ceil((double) totalManager / size);
	    
	    ModelAndView mv = new ModelAndView("manager/manager/manager_super_list");
	    mv.addObject("manager_list", managerList);
	    mv.addObject("currentPage", page);
	    mv.addObject("totalPages", totalPages);

	    return mv;
	}

}
