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
	public ModelAndView UserCenterNoice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("notice");
		
	
		//1. 전체 게시물의 수를 구하기
		int count = userCenterService.getTotalCount();
		paging.setTotalRecord(count);
		
		// 2. 전체 페이지의 수 구하기
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if(paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1 );
			}
		}
		// 3. 파라미터에서 넘어오는 cPage(보고싶은 페이지번호)를 구하자 
		String cPage = request.getParameter("cPage");
		
		if(cPage == null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage()-1));
		
		
		// 시작블록과 끝블록 구하기
		paging.setBeginBlock(
				(int)(((paging.getNowPage()-1) / paging.getPagePerBlock()) * paging.getPagePerBlock()+1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() -1);
		
		// 주의 사항 
		// enbBlock(3,6,9...) 실제 가지고 총 페이지는 20개일경우  4페이지 까지 
		if(paging.getEndBlock() >  paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		// DB 갔다가 오기 
		List<NoticeVO> list = userCenterService.getNoticeList(paging.getOffset(), paging.getNumPerPage());
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
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
