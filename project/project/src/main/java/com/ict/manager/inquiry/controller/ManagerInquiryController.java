package com.ict.manager.inquiry.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.inquiry.vo.ManagerInquiryVO;
import com.ict.manager.user.service.UserService;
import com.ict.manager.user.vo.ManagerUserVO;
import com.ict.manager.inquiry.answer.service.InquiryAnswerService;
import com.ict.manager.inquiry.answer.vo.ManagerInquiryAnswerVO;
import com.ict.manager.inquiry.service.InquiryService;

@Controller
public class ManagerInquiryController {

	@Autowired
	private InquiryService inquiryService;

	@Autowired
	private InquiryAnswerService inquiryAnswerService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private com.ict.common.Paging paging;
	
	
	// 관리자페이지
	
	@RequestMapping("/inquiry_list")
	public ModelAndView getInquiryList(@RequestParam(defaultValue = "1") int page) {
		// 열 개수 정해놓고 페이지도 1이 default
		int size = 10;
		int offset = (page - 1) * size;

		ModelAndView mv = new ModelAndView("manager/inquiry/list");
		List<ManagerInquiryVO> list = inquiryService.getInquiryList(page, size);

		int totalInquiry = inquiryService.getTotalCount();
		int totalPages = (int) Math.ceil((double) totalInquiry / size);

		mv.addObject("list", list);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);
		return mv;
	}

	@GetMapping("/inquiry_detail")
	public ModelAndView getinquiryDetail(@RequestParam("u_idx") String u_idx) {
		ModelAndView mv = new ModelAndView("manager/inquiry/detail");

		// 상세보기
		ManagerInquiryVO mivo = inquiryService.getInquiryDetail(u_idx);
		mv.addObject("mivo", mivo);

		// 답변 데이터
		String answer = inquiryAnswerService.getAnswer(u_idx);
		mv.addObject("answer", answer);

		return mv;
	}

	@GetMapping("/inquiry_answer")
	public ModelAndView getinquiryAnswer(@RequestParam("u_idx") String u_idx) {
		ModelAndView mv = new ModelAndView("manager/inquiry/answer");

		// 상세보기
		ManagerInquiryVO mivo = inquiryService.getInquiryDetail(u_idx);

		mv.addObject("mivo", mivo);

		return mv;
	}

	@PostMapping("/inquiry_answer_ok")
	public ModelAndView inquiryAnswerOk(@RequestParam("u_idx") String u_idx, ManagerInquiryAnswerVO miavo,
			HttpServletRequest request) {
		// u_idx
		miavo.setU_idx(u_idx);
		// 관리자 id
		String adminId = (String) request.getSession().getAttribute("manager_id");
		miavo.setAdmin_id(adminId);
		ModelAndView mv = new ModelAndView();
		try {
			int result = inquiryAnswerService.getAnswerInsert(miavo);
			if (result > 0) {
				mv.setViewName("redirect:/inquiry_detail?u_idx=" + miavo.getU_idx());
				return mv;
			}
			return new ModelAndView("manager/error");
		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("manager/error");
		}
	}

	@GetMapping("/inquiry_down")
	public void inquiryDown(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			String r_path = URLEncoder.encode(path, "UTF-8");
			// 브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);

			// 실제 가져오기
			File file = new File(new String(path.getBytes(), "UTF-8"));
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();

			FileCopyUtils.copy(in, out);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	@PostMapping("/inquiry_delete")
	public ModelAndView getinquiryDelete(@ModelAttribute("u_idx") String u_idx, @ModelAttribute("cPage") String cPage) {
		return new ModelAndView("manager/inquiry/delete");
	}

	@PostMapping("/inquiry_delete_ok")
	public ModelAndView getinquiryDeleteOk(@ModelAttribute("u_idx") String u_idx,
			@ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView();

		int result = inquiryService.getInquiryDelete(u_idx);
		if (result > 0) {
			mv.setViewName("redirect:/inquiry_list");
			return mv;
		}

		return new ModelAndView("manager/error");
	}

	@PostMapping("/inquiry_update")
	public ModelAndView inquiryUpdate(@RequestParam("u_idx") String u_idx) {
		ModelAndView mv = new ModelAndView("manager/inquiry/update");
		ManagerInquiryVO mivo = inquiryService.getInquiryDetail(u_idx);
		String answer = inquiryAnswerService.getAnswer(u_idx);
		if (mivo != null) {
			mv.addObject("mivo", mivo);
			mv.addObject("answer", answer);
			return mv;
		}
		return new ModelAndView("manager/error");
	}

	@PostMapping("/inquiry_update_ok")
	public ModelAndView getinquiryUpdateOk(@ModelAttribute("u_idx") String u_idx, ManagerInquiryAnswerVO miavo,
			HttpServletRequest request) {
		miavo.setU_idx(u_idx);
		ModelAndView mv = new ModelAndView();
		try {
			int result = inquiryAnswerService.getAnswerUpdate(miavo);
			if (result > 0) {
				mv.setViewName("redirect:/inquiry_detail?u_idx=" + miavo.getU_idx());
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("manager/error");
		}

		return new ModelAndView("manager/error");
	}

	@GetMapping("/inquiry_search")
	public ModelAndView searchInquiry(@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(defaultValue = "1") int page) {
		int size = 10; // 페이지당 항목 수
		int offset = (page - 1) * size; // 검색 결과에 적용할 오프셋

		List<ManagerInquiryVO> inquiryList;
		int totalInquiry;

		if (keyword != null && !keyword.isEmpty()) {
			inquiryList = inquiryService.getSearchInquiry(keyword, page, size); // 검색어와 페이지네이션을 반영한 검색 로직
			System.out.println(inquiryList);
			totalInquiry = inquiryService.getSearchInquiryCount(keyword); // 검색어에 따른 총 사용자 수
		} else {
			inquiryList = inquiryService.getInquiryList(page, size); // 전체 사용자 목록
			totalInquiry = inquiryService.getSearchInquiryCount(keyword);
		}

		int totalPages = (int) Math.ceil((double) totalInquiry / size);

		ModelAndView mv = new ModelAndView("manager/inquiry/list");
		mv.addObject("list", inquiryList);
		mv.addObject("currentPage", page);
		mv.addObject("totalPages", totalPages);

		return mv;
	}
	
	
	
	// 마이페이지

	@RequestMapping("/myInquiry")
	public ModelAndView getInquiryList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("mypage/myInquiry");
		
		// 세션
		String user_id = (String) session.getAttribute("user_id");
		
		// 페이징기법
		// 1. 전체 게시물의 수를 구한다.
		int count = inquiryService.getTotalUserCount(user_id);
		System.out.println(count);
		paging.setTotalRecord(count);

		// 2. 전체 페이지의 수를 구한다.
		// NumPerPage 페이지보다 작을 경우 1페이지
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}

		// 3. 파라미터에서 넘어오는 *cPage(보고 싶은 페이지 번호)*를 구하자
		String cPage = request.getParameter("cPage");

		// 만약에 cPage가 null이면 무조건 1 page이다.
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}

		// 4. cPage를 기준으로 begin, end, beginBlock, endBlock
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

		// 시작블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) (((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의사항
		// endBlock(3,6,9...) 실제 가지고 있는 총 페이지는 20개일 경우 4페이지까지
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}

		// DB 갔다오기
		List<ManagerInquiryVO> list = inquiryService.getInquiryUserList(user_id, paging.getOffset(),
				paging.getNumPerPage());

		// answer
		List<ManagerInquiryAnswerVO> alist = new ArrayList<>();
		for (ManagerInquiryVO inquiry : list) {
			List<ManagerInquiryAnswerVO> answer = inquiryService.getCommentList(inquiry.getU_idx());
			 if (answer.isEmpty()) {
				 ManagerInquiryAnswerVO defaultAnswer = new ManagerInquiryAnswerVO();
			        defaultAnswer.setAnswer("아직 답변이 등록되지 않았습니다");
			        answer.add(defaultAnswer);
			    }
			alist.addAll(answer);
		}

		mv.addObject("list", list);
		mv.addObject("answerList", alist);
		mv.addObject("paging", paging);
		return mv;

	}

	// 1:1문의 작성 화면
	@GetMapping("/inquiryWrite")
	public ModelAndView getInquiryWrite(HttpServletRequest request) {
		// 세션 우선 주석
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("user_id");
		System.out.println(userId);
		ManagerUserVO userInfo = userService.getUserDetail(userId);
		System.out.println(userInfo.getUsername());
		
		ModelAndView mv = new ModelAndView("mypage/inquiryWrite");
		if (userInfo != null) {
			mv.addObject("username", userInfo.getUsername());
			mv.addObject("email", userInfo.getEmail());
			mv.addObject("phone", userInfo.getPhone_number());
		}
		return mv;
	}

	@PostMapping("/inquiryWrite_ok")
	public ModelAndView getInquiryWriteOK(ManagerInquiryVO mivo, HttpServletRequest request) {
		// 세션
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("user_id");
		mivo.setUser_id(userId);
		try {
			// 기본 리다이렉트 경로를 다중 리다이렉트를 위한 페이지로 설정
			ModelAndView mv = new ModelAndView("redirect:/myInquiry");

			String rawPassword = mivo.getPassword();
			if (rawPassword == null || rawPassword.isEmpty()) {
				// 비밀번호가 없을 경우 에러 페이지로 이동
				return new ModelAndView("/error").addObject("message", "Password cannot be null or empty.");
			}

			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			MultipartFile file = mivo.getFile_name();

			if (file.isEmpty()) {
				mivo.setF_name("");
			} else {
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString() + "_" + file.getOriginalFilename();
				mivo.setF_name(f_name);

				// 업로드
				file.transferTo(new File(path, f_name));
			}

			// 비밀번호 암호화
			String pwd = passwordEncoder.encode(rawPassword);
			mivo.setPassword(pwd);

			// 사용자용 DB 저장
			int result = inquiryService.getInquiryInsert(mivo);

			// 관리자용 DB 저장

			if (result > 0) {
				return mv;
			}
			return new ModelAndView("error");

		} catch (Exception e) {
			System.out.println(e);
			return new ModelAndView("mypage/error");
		}
	}

	@GetMapping("/inquiryDetail")
	public ModelAndView getInquiryDetail(@RequestParam("u_idx") String u_idx, @ModelAttribute("cPage") String cPage) {
		ModelAndView mv = new ModelAndView("mypage/inquiryDetail");

		// 상세보기
		ManagerInquiryVO mivo = inquiryService.getInquiryDetail(u_idx);

		// 관리자 답변 가져오기
		String answer = inquiryAnswerService.getAnswer(u_idx);

		mv.addObject("answer", answer);
		mv.addObject("mivo", mivo);
		return mv;
	}

	@GetMapping("/user_inquiry_down")
	public void inquiryUserDown(HttpServletRequest request, HttpServletResponse response) {
		try {
			String f_name = request.getParameter("f_name");
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/" + f_name);
			String r_path = URLEncoder.encode(path, "UTF-8");

			// 브라우저 설정
			response.setContentType("aplication/c_msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=" + r_path);

			// 다운로드
			File file = new File(new String(path.getBytes(), "UTF-8"));
			FileInputStream in = new FileInputStream(file);
			OutputStream out = response.getOutputStream();

			FileCopyUtils.copy(in, out);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
