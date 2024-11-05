package com.ict.manager.notice.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.common.Paging;
import com.ict.manager.notice.service.NoticeService;
import com.ict.manager.notice.vo.NoticeVO;


@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private Paging paging;
	
	@GetMapping("/adminnotice_list")
	public ModelAndView NoticeList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("manager/manager_notice");
		//1. 전체 게시물의 수를 구하기
		int count = noticeService.getTotalCount();
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
				List<NoticeVO> list = noticeService.getNoticeList(paging.getOffset(), paging.getNumPerPage());
				NoticeVO nvo = new NoticeVO();
				System.out.println(nvo.getViews());
				
				mv.addObject("list", list);
				mv.addObject("paging", paging);
				return mv;
			}
	
	@GetMapping("/adminnotice_write")
	public ModelAndView getNoticeWrite() {
		return new ModelAndView("manager/manager_noticewrite");
	}
	
	@PostMapping("/adminnotice_write_ok")
	public ModelAndView getNoticeWriteOk(NoticeVO nvo , HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:/adminnotice_list");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = nvo.getFile_name();
			if(file.isEmpty()) {
				nvo.setF_name("");
			}else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				nvo.setF_name(f_name);
				
				// 업로드
				file.transferTo(new File(path, f_name));
			}
			
			// 비밀번호 암호화
			String pwd = passwordEncoder.encode(nvo.getPwd());
			nvo.setPwd(pwd);
			
			int result = noticeService.getNoticeInsert(nvo);
			if(result>0) {
				return mv;
			}
			
			return new ModelAndView("manager/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}
	}
	
	@GetMapping("adminnotice_detail")
	public ModelAndView getgetNoticeDetail(@RequestParam("n_idx") String n_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/manager_noticedetail");
		
		// 조회수 증가
		
		int result = noticeService.getNoticeViewUpdate(n_idx);
		System.out.println(result);
		//  상세보기
		NoticeVO nvo = noticeService.getNoticeDetail(n_idx);
		mv.addObject("nvo",nvo);
		return mv;
		
	}
	@PostMapping("adminnotice_update")
	public ModelAndView getNoticeUpdate(@ModelAttribute("n_idx") String n_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/manager_noticeupdate");
		// DB에서 b_idx를 이용해서 정보 가져오기
		NoticeVO nvo = noticeService.getNoticeDetail(n_idx);
		if(nvo != null) {
			mv.addObject("nvo", nvo);
			return mv;
		}
		return null;
	}
	
	
	@PostMapping("/adminnotice_update_ok")
	public ModelAndView getNoticeUpdateOK(NoticeVO nvo , HttpServletRequest request,
			@ModelAttribute("cPage")String cPage, 
			@ModelAttribute("n_idx") String n_idx) {
		
		ModelAndView mv = new ModelAndView();
		// 비밀번호 검사
		NoticeVO nvo2 = noticeService.getNoticeDetail(n_idx);
		
		String dbpwd = nvo2.getPwd();
		if(passwordEncoder.matches(nvo.getPwd(), dbpwd)) {
			// 원글 수정
			try {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload");
				MultipartFile file = nvo.getFile_name();
				String old_f_name = nvo.getOld_f_name();
				
				if(file.isEmpty()) {
					nvo.setF_name(old_f_name);
				}else {
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString()+"_"+file.getOriginalFilename();
					nvo.setF_name(f_name);
					
					file.transferTo(new File(path, f_name));
				}
				int result = noticeService.getNoticeUpdate(nvo);
				if(result > 0) {
					
					mv.setViewName("redirect:/adminnotice_detail");
					return mv;
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			
		}else {
			// 비밀번호가 틀리다
			mv.setViewName("manager/manager_noticeupdate");
			mv.addObject("pwdchk","fail");
			mv.addObject("nvo",nvo);
			return mv;			
		}
		return new ModelAndView("manager/error");
	}
	
	@PostMapping("/adminnotice_delete")
	public ModelAndView getNoticesDelete(@ModelAttribute("n_idx") String n_idx,
			@ModelAttribute("cPage") String cPage) {
			ModelAndView mv = new ModelAndView("manager/manager_noticedelete");
			
			return mv;
	}
	
	@PostMapping("/adminnotice_delete_ok")
	public ModelAndView getNoticeDeleteOK(@RequestParam("pwd") String pwd,
			@ModelAttribute("n_idx") String n_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView();
		
		// 비밀번호 체크
		NoticeVO nvo = noticeService.getNoticeDetail(n_idx);
		String dbpwd = nvo.getPwd();
		if(passwordEncoder.matches(pwd, dbpwd)) {
			// 원글 삭제
			// active 컬럼을 0 -> 1로 변경
			int result = noticeService.getNoticeDelete(n_idx);
			if(result > 0) {
				mv.setViewName("redirect:/adminnotice_list");
				return mv;
			}
		}else {
			// 비밀번호가 틀리다
			mv.setViewName("manager/manager_noticedelete");
			mv.addObject("pwdchk","fail");
			return mv;			
		}
		return new ModelAndView("manager/error");
	}
	
	
}
	
	















