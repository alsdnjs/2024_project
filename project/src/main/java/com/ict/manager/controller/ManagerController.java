package com.ict.manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.service.ManagerService;
import com.ict.manager.vo.ManagerVO;

@Controller
public class ManagerController {

	@Autowired
	private ManagerService guestBook2Service;
	

	@GetMapping("/manager_list")
	public ModelAndView ManagerList(@RequestParam(defaultValue = "1") int page) {
		// 열 개수 정해놓고 페이지도 1이 default
		int size = 10;
		int offset = (page-1)*size;
		
		ModelAndView mv = new ModelAndView("manager/manager_super_list");
		List<ManagerVO> manager_list = guestBook2Service.getManagerList(page, size);
		int totalManagers = guestBook2Service.getManagerCount();
		int totalPages = (int) Math.ceil((double) totalManagers / size);
		
		mv.addObject("manager_list", manager_list);
		mv.addObject("currentPage", page);
	    mv.addObject("totalPages", totalPages);
	    
		return mv;
	}

	@GetMapping("/manager_write")
	public ModelAndView ManagerWrite() {
		return new ModelAndView("manager/manager_write");
	}

	@GetMapping("/manager_detail")
	public ModelAndView ManagerDetail(@RequestParam("manager_id") String manager_id) {
		ModelAndView mv = new ModelAndView("manager/manager_onelist");
		ManagerVO mvo = guestBook2Service.getManagerDetail(manager_id);
		if (mvo != null) {
			mv.addObject("mvo", mvo);
			return mv;
		}
		System.out.println("여기는 컨트롤러 에러");
		return new ModelAndView("manager/error");
	}

	@PostMapping("/manager_write_ok")
	public ModelAndView ManagerWriteOk(ManagerVO mvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/manager_list");
			int result = guestBook2Service.getManagerInsert(mvo);
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
		return new ModelAndView("manager/manager_delete");
	}

	@PostMapping("/manager_delete_ok")
	public ModelAndView ManagerDeleteOK(ManagerVO mvo) {
		ModelAndView mv = new ModelAndView();

		// 비밀번호가 맞는지 검사
		ManagerVO mvo2 = guestBook2Service.getManagerDetail(mvo.getManager_id());
		
		String pw = mvo.getManager_pw();
		String pw2 = mvo2.getManager_pw();

		if (pw.equals(pw2)) {
			int result = guestBook2Service.getManagerDelete(mvo.getManager_id());
			if (result > 0) {
				mv.setViewName("redirect:/manager_list");
				return mv;
			}
		} else {
			mv.setViewName("manager/manager_delete");
			mv.addObject("pwdchk", "fail");
			mv.addObject("manager_id", mvo.getManager_id());
			return mv;
		}
		return new ModelAndView("manager/delete");
	}

	@PostMapping("/manager_update")
	public ModelAndView ManagerUpdate(@RequestParam("manager_id") String manager_id) {
		ModelAndView mv = new ModelAndView("manager/manager_update");
		ManagerVO mvo = guestBook2Service.getManagerDetail(manager_id);
		if (mvo != null) {
			mv.addObject("mvo", mvo);
			return mv;
		}
		return new ModelAndView("manager/error");
	}

	@PostMapping("/manager_update_ok")
	public ModelAndView ManagerUpdateOK(ManagerVO mvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		try {
			int result = guestBook2Service.getManagerUpdate(mvo);
			System.out.println(mvo.getManager_id());
			System.out.println(mvo.getManager_type());
			System.out.println(mvo.getManager_pw());
			System.out.println(mvo.getManager_name());
			System.out.println(mvo.getManager_email());
			if (result > 0) {
				mv.setViewName("redirect:/manager_detail?manager_id=" + mvo.getManager_id());
				return mv;
			}

			System.out.println("값이 안들어갔음");

			return new ModelAndView("manager/error");

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}

	}

}
