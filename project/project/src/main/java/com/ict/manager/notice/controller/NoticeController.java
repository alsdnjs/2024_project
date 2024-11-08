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

import com.ict.manager.notice.service.NoticeService;
import com.ict.manager.notice.vo.NoticeVO;
import com.ict.manager.user.vo.ManagerUserVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/adminnotice_list")
	public ModelAndView NoticeList(@RequestParam(defaultValue = "1") int page, HttpServletRequest request) {
		int size = 10;
		int offset = (page-1) * size;
		
		ModelAndView mv = new ModelAndView("manager/notice/notice_list");
		List<NoticeVO> list = noticeService.getNoticeList(page, size);
		
		int totalnotice = noticeService.getTotalCount();
		int totalPages = (int) Math.ceil((double) totalnotice / size);
		NoticeVO nvo = new NoticeVO();

		mv.addObject("list", list);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);
		return mv;
	}

	@GetMapping("/adminnotice_write")
	public ModelAndView getNoticeWrite() {
		return new ModelAndView("manager/notice/notice_write");
	}

	@PostMapping("/adminnotice_write_ok")
	public ModelAndView getNoticeWriteOk(NoticeVO nvo, HttpServletRequest request) {
		// 매니저 id 자동삽입
		String managerId = (String) request.getSession().getAttribute("manager_id");
		nvo.setWriter(managerId);

		try {
			ModelAndView mv = new ModelAndView("redirect:/adminnotice_list");

			// 파일
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = nvo.getFile_name();
			if (file.isEmpty()) {
				nvo.setF_name("");
			} else {
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
			if (result > 0) {
				return mv;
			}

			return new ModelAndView("manager/error");

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}
	}

	@GetMapping("adminnotice_detail")
	public ModelAndView getgetNoticeDetail(@RequestParam("n_idx") String n_idx) {
		ModelAndView mv = new ModelAndView("manager/notice/notice_detail");
		// 상세보기
		NoticeVO nvo = noticeService.getNoticeDetail(n_idx);
		mv.addObject("nvo", nvo);
		return mv;
	}

	@PostMapping("adminnotice_update")
	public ModelAndView getNoticeUpdate(@ModelAttribute("n_idx") String n_idx) {
		ModelAndView mv = new ModelAndView("manager/notice/notice_update");
		// DB에서 n_idx를 이용해서 정보 가져오기
		NoticeVO nvo = noticeService.getNoticeDetail(n_idx);
		if (nvo != null) {
			mv.addObject("nvo", nvo);
			return mv;
		}
		return null;
	}

	@PostMapping("/adminnotice_update_ok")
	public ModelAndView getNoticeUpdateOK(NoticeVO nvo, HttpServletRequest request,
			@ModelAttribute("n_idx") String n_idx) {
		
		// 매니저 id 자동삽입
		String managerId = (String) request.getSession().getAttribute("manager_id");
		nvo.setWriter(managerId);
		
		ModelAndView mv = new ModelAndView();
		
		// 비밀번호 검사
		NoticeVO nvo2 = noticeService.getNoticeDetail(n_idx);
		
		String dbpwd = nvo2.getPwd();
		if (passwordEncoder.matches(nvo.getPwd(), dbpwd)) {
			// 원글 수정
			try {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload");
				MultipartFile file = nvo.getFile_name();
				String old_f_name = nvo.getOld_f_name();

				if (file.isEmpty()) {
					nvo.setF_name(old_f_name);
				} else {
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString() + "_" + file.getOriginalFilename();
					nvo.setF_name(f_name);

					file.transferTo(new File(path, f_name));
				}
				int result = noticeService.getNoticeUpdate(nvo);
				if (result > 0) {

					mv.setViewName("redirect:/adminnotice_detail");
					return mv;
				}
			} catch (Exception e) {
				System.out.println(e);
			}

		} else {
			// 비밀번호가 틀리다
			mv.setViewName("manager/notice/notice_update");
			mv.addObject("pwdchk", "fail");
			mv.addObject("nvo", nvo);
			return mv;
		}
		return new ModelAndView("manager/error");
	}

	@PostMapping("/adminnotice_delete")
	public ModelAndView getNoticesDelete(@ModelAttribute("n_idx") String n_idx, @ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("manager/notice/notice_delete");

		return mv;
	}

	@PostMapping("/adminnotice_delete_ok")
	public ModelAndView getNoticeDeleteOK(@RequestParam("pwd") String pwd, @ModelAttribute("n_idx") String n_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView();

		// 비밀번호 체크
		NoticeVO nvo = noticeService.getNoticeDetail(n_idx);
		String dbpwd = nvo.getPwd();
		if (passwordEncoder.matches(pwd, dbpwd)) {
			// 원글 삭제
			// active 컬럼을 0 -> 1로 변경
			int result = noticeService.getNoticeDelete(n_idx);
			if (result > 0) {
				mv.setViewName("redirect:/adminnotice_list");
				return mv;
			}
		} else {
			// 비밀번호가 틀리다
			mv.setViewName("manager/notice/notice_delete");
			mv.addObject("pwdchk", "fail");
			return mv;
		}
		return new ModelAndView("manager/error");
	}
	
	@GetMapping("/adminnotice_search")
	public ModelAndView searchNotice(@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(defaultValue = "1") int page) {
		// System.out.println(keyword); 얘는 잘 넘어옴..
		int size = 10; // 페이지당 항목 수
		int offset = (page - 1) * size; // 검색 결과에 적용할 오프셋

		List<NoticeVO> noticeList;
		int totalNotice;

		if (keyword != null && !keyword.isEmpty()) {
			noticeList = noticeService.getSearchNotice(keyword, page, size); // 검색어와 페이지네이션을 반영한 검색 로직
			System.out.println(noticeList);
			totalNotice = noticeService.getSearchNoticePage(keyword); // 검색어에 따른 총 사용자 수
		} else {
			noticeList = noticeService.getNoticeList(page, size); // 전체 사용자 목록
			totalNotice = noticeService.getTotalCount();
		}

		int totalPages = (int) Math.ceil((double) totalNotice / size);

		ModelAndView mv = new ModelAndView("manager/notice/notice_list");
		mv.addObject("list", noticeList);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);

		return mv;
	}

}
