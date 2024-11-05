package com.ict.inquiry.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import com.ict.common.Paging;
import com.ict.inquiry.service.InquiryService;
import com.ict.inquiry.vo.InquiryVO;
import com.mysql.cj.Session;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private Paging paging;
	
	@Value("${file.upload-dir}")  // jdbc.properties에서 파일 경로 주입
    private String uploadDir;
	
	/*
	@RequestMapping("/adminInquiry")
	public ModelAndView admin0() {
		return new ModelAndView("day02/adminInquiry");
	}
	*/
	@RequestMapping("/prac")
	public ModelAndView firstin0() {
		return new ModelAndView("mypage/mypage");
	}
	@RequestMapping("/mypage")
	public ModelAndView getMypage() {
		return new ModelAndView("mypage/mypage");
	}
	@RequestMapping("/orderHistory")
	public ModelAndView getOrderHistory() {
		return new ModelAndView("mypage/orderHistory");
	}
	@RequestMapping("/updateProfile")
	public ModelAndView getUpdateProfile() {
		return new ModelAndView("mypage/updateProfile");
	}
	@RequestMapping("/update")
	public ModelAndView getupdate() {
		return new ModelAndView("mypage/update");
	}
	@RequestMapping("/membership")
	public ModelAndView getmembership() {
		return new ModelAndView("mypage/membership");
	}
	
	
	@RequestMapping("/myInquiry")
	public ModelAndView getInquiryList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("mypage/myInquiry");
		
//		String user_id = (String) session.getAttribute("user_id");
		String user_id = "{user_id";
		System.out.println(user_id);
		// 페이징기법
		// 1. 전체 게시물의 수를 구한다.
		int count = inquiryService.getTotalCount(user_id);
		System.out.println(count);
		paging.setTotalRecord(count);
		
		// 2. 전체 페이지의 수를 구한다.
		// NumPerPage 페이지보다 작을 경우 1페이지
		if (paging.getTotalRecord()<= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord()/ paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage()+1);
			}
		}
		
		// 3. 파라미터에서 넘어오는 *cPage(보고 싶은 페이지 번호)*를 구하자
		String cPage = request.getParameter("cPage");
		
		// 만약에 cPage가 null이면 무조건 1 page이다.
		if (cPage == null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		// 4. cPage를 기준으로 begin, end, beginBlock, endBlock,
		// offset = limit * (현재 페이지 - 1)
		// limit = numPerPage (현 페이지에 있는 글 개수)
		// select * from inquiry order by b_idx desc limit 3 offset 0~;
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage()-1));
		
		// 시작블록과 끝블록 구하기
		paging.setBeginBlock(
				(int)(((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1));
		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
		
		// 주의사항
		// endBlock(3,6,9...) 실제 가지고 있는 총 페이지는 20개일 경우 4페이지까지
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		// DB 갔다오기
		List<InquiryVO> list = inquiryService.getInquiryList(user_id, paging.getOffset(), paging.getNumPerPage());
		
		System.out.println(list);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;
		
		}
		
		// 1:1문의 작성 화면
		@GetMapping("/inquiryWrite")
		public ModelAndView getInquiryWrite() {
			return new ModelAndView("mypage/inquiryWrite");
		}
		
		@PostMapping("/inquiryWrite_ok")
		public ModelAndView getInquiryWriteOK(InquiryVO ivo, HttpServletRequest request) {
			 try {
				 	// 기본 리다이렉트 경로를 다중 리다이렉트를 위한 페이지로 설정
			        ModelAndView mv = new ModelAndView("redirect:/myInquiry");
			        
			        String rawPassword = ivo.getPassword();
			        if (rawPassword == null || rawPassword.isEmpty()) {
			            // 비밀번호가 없을 경우 에러 페이지로 이동
			            return new ModelAndView("day02/error").addObject("message", "Password cannot be null or empty.");
			        }
			        
			        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			        MultipartFile file = ivo.getFile_name();
			        
			        if (file.isEmpty()) {
			            ivo.setF_name("");
			        } else {
			            UUID uuid = UUID.randomUUID();
			            String f_name = uuid.toString() + "_" + file.getOriginalFilename();
			            ivo.setF_name(f_name);
			            
			            // 업로드
			            file.transferTo(new File(path, f_name));
			        }
			        
			        // 비밀번호 암호화
			        String pwd = passwordEncoder.encode(rawPassword);
			        ivo.setPassword(pwd);
			        
			        // 사용자용 DB 저장
			        int result = inquiryService.getInquiryInsert(ivo);
			        
			        // 관리자용 DB 저장
			        
			        
			        if (result > 0) {
			            return mv;
			        }
			        return new ModelAndView("mypage/error");
			        
			    } catch (Exception e) {
			        System.out.println(e);
			        return new ModelAndView("mypage/error");
			    }
			}
		
			@GetMapping("/inquiryDetail")
			public ModelAndView getInquiryDetail(@RequestParam("u_idx") String u_idx, @ModelAttribute("cPage") String cPage) {
				ModelAndView mv = new ModelAndView("mypage/inquiryDetail");
				
				// 상세보기
				InquiryVO ivo = inquiryService.getInquiryDetail(u_idx);
				
				// 관리자 답변 가져오기
				// List<CommVO> clist = inquiryService.getCommentList(u_idx);
				
				// mv.addObject("clist", clist);
				mv.addObject("ivo", ivo);
				return mv;						
			}
			
			
			@GetMapping("/inquiry_down") 
			public void inquiryDown(HttpServletRequest request, HttpServletResponse response) { 
				try {
					String f_name = request.getParameter("f_name");
					String path = request.getSession().getServletContext().getRealPath("/resources/upload/"+f_name);
					String r_path = URLEncoder.encode(path, "UTF-8");
					
					// 브라우저 설정
					response.setContentType("aplication/c_msdownload");
					response.setHeader("Content-Disposition", "attachment; filename=" + r_path);
					
					// 다운로드
					File file = new File(new String (path.getBytes(), "UTF-8"));
					FileInputStream in = new FileInputStream(file);
					OutputStream out = response.getOutputStream();
					
					FileCopyUtils.copy(in, out);
					
				} catch (Exception e) { 
					System.out.println(e);
				}
			}
			
			@RequestMapping("/adminInquiry")
			public ModelAndView getAdminInquiry(HttpServletRequest request) {
				ModelAndView mv = new ModelAndView("mypage/adminInquiry");

				// 모든 사용자의 문의 내역을 가져오기
			    List<InquiryVO> allList = inquiryService.getAdminInquiry();
				if (allList != null) {
			    mv.addObject("allList", allList);
				return mv;
				}
				return new ModelAndView("mypage/error");
			
	}
}





