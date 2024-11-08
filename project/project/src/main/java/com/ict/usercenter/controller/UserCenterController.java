package com.ict.usercenter.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.notice.service.NoticeService;
import com.ict.manager.notice.vo.NoticeVO;
import com.ict.usercenter.service.UserCenterService;

@Controller
public class UserCenterController {
	
	@Autowired
	private UserCenterService userCenterService;
	
	@Autowired
	private NoticeService noticeService;
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private Paging paging;
	
	@GetMapping("/notice")
	public ModelAndView UserCenterNoice(@RequestParam(defaultValue = "1") int page, HttpServletRequest reques) {
		int size = 10;
		int offset = (page-1) * size;
		
		ModelAndView mv = new ModelAndView("/notice");
		List<NoticeVO> list = noticeService.getNoticeList(page, size);
		
		int totalnotice = noticeService.getTotalCount();
		int totalPages = (int) Math.ceil((double) totalnotice / size);
		NoticeVO nvo = new NoticeVO();

		mv.addObject("list", list);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);
		return mv;
	}
	
	@GetMapping("/notice_detail")
	public ModelAndView getNoticeDetail(@ModelAttribute("cpage")String cPage,
			@RequestParam("n_idx") String n_idx) {
		System.out.println(n_idx);
		ModelAndView mv = new ModelAndView("noticedetail");
		
		NoticeVO nvo = userCenterService.getCenterDetail(n_idx);
		mv.addObject("nvo",nvo);
		return mv;
	}
	
	
	

	
	
	@GetMapping("/questions")
	public String showFAQPage() {
		return "questions"; // 
	}

	@GetMapping("/rank")
	public String RankPage() {
		return "rank";
	}

	@GetMapping("/productinquiries")
	public String ProductinquiriesPage() {
		return "productinquiries";
	}

	@GetMapping("/oneinquiries")
	public String Oneinquiries() {
		return "oneinquiries";
	}

	@GetMapping("/main")
	public String MainPage() {
		return "index";
	}

}
