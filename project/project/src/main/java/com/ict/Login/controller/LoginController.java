package com.ict.Login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.member.service.MemberService;
import com.ict.member.vo.MemberVO;
import com.ict.saup.service.SaupService;
import com.ict.saup.vo.SaupVO;


@Controller
public class LoginController {
	@Autowired
    private MemberService memberService;

    @Autowired
    private SaupService saupService;
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	// 관리자 페이지로 이동
	@GetMapping("/adminlogin")
	public String AdminLoginForm() {
		return "admin/adminlogin";  // 로그인 폼 페이지 (loginform2222.jsp)
	}
	
    // 로그인 페이지로 이동
	@GetMapping("/user_login")
	public String loginForm() {
		return "login/login";  // 
	}
   
    // 일반 회원가입 페이지로 이동
    @GetMapping("/join")
    public ModelAndView joinForm() {
    	ModelAndView mv = new ModelAndView("mainlogin/joinform");
    	mv.addObject("user_role", "일반사용자");
        return mv;  // 회원가입 폼 페이지 (joinform.jsp)
    }
    
    // 사업자 , 개인 회원가입 부분 
    @GetMapping("/mini")
    public String mini() {
        return "mainlogin/mini";
    }
    

    @GetMapping("/agree")
    public String agree() {
        return "mainlogin/agree";
    }

  
    @GetMapping("/agree2")
    public String agree2() {
        return "mainlogin/agree2";
    }

    @GetMapping("/saup")
    public ModelAndView join1Form() {
    	ModelAndView mv = new ModelAndView("mainlogin/saupjoin");
    	mv.addObject("user_role", "사업자");
    	return mv;  // 회원가입 폼 페이지 (joinform.jsp)
    }
    
   
    
    
    

    // 회원가입 처리 (일반 사용자 및 사업자 구분)
    @PostMapping("/join")
    public ModelAndView registerUser(MemberVO memberVO, SaupVO saupVO, @RequestParam("user_role") String user_role) {
        ModelAndView mv = new ModelAndView("login/login"); // 회원가입 성공 후 로그인 페이지로 이동
        try {
            System.out.println("회원가입 시도 - User Role: " + user_role);

            // 비밀번호 암호화
            if (memberVO.getPassword() == null) {
                System.out.println("Error: Password is null");
            } else {
                String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
                memberVO.setPassword(encodedPassword);
            }

            // 사용자 역할에 따라 다른 테이블에 데이터 저장
            if ("일반사용자".equals(user_role)) {
                int result = memberService.registerMember(memberVO); // 일반 사용자 정보 저장
                System.out.println("일반 사용자 등록 결과: " + result);
                mv.addObject("registerResult", result > 0 ? "success" : "fail");
            } else if ("사업자".equals(user_role)) {
            	 // 사업자 회원가입 시도 로그 추가
                System.out.println("사업자 회원가입 시도");
                // SaupVO에 추가 정보를 설정
                saupVO.setUser_id(memberVO.getUser_id());

                // users 테이블에 일반 회원 정보를 저장
                int userResult = memberService.registerMember(memberVO); 
                // sellers 테이블에 사업자 정보를 저장
                int saupResult = saupService.registerSaup(saupVO);

                // 결과 로그 출력
                System.out.println("userResult: " + userResult + ", saupResult: " + saupResult);
                
                if (userResult > 0 && saupResult > 0) {
                    mv.addObject("registerResult", "success");
                } else {
                    mv.addObject("registerResult", "fail");
                }
            }
        } catch (Exception e) {
            System.out.println("회원가입 중 예외 발생: " + e);
            mv.addObject("registerResult", "error");
        }
        return mv;
    }
    
	@GetMapping("/index")
	public String index() {
	    return "index"; // index.jsp 또는 index.html 페이지로 이동
	}
    
    @PostMapping("/user_login2")
    public ModelAndView loginUser(MemberVO memberVO, HttpSession session) {
        System.out.println("로그인 메서드 호출됨");
        ModelAndView mv = new ModelAndView();
        try {
            // loginCheck 메서드 호출 확인
            System.out.println("로그인 시도: " + memberVO.getUser_id());
            MemberVO foundUser = memberService.loginCheck(memberVO.getUser_id());
            
            // 사용자가 조회되었는지 확인하는 로그
            if (foundUser != null) {
                System.out.println("사용자 있음: " + foundUser.getUser_id());

                // 입력된 비밀번호와 DB의 비밀번호 확인
                System.out.println("로그인 시 입력된 비밀번호: " + memberVO.getPassword());
                System.out.println("DB에 저장된 암호화된 비밀번호: " + foundUser.getPassword());

                // 비밀번호 일치 여부 확인
                boolean isPasswordMatch = passwordEncoder.matches(memberVO.getPassword(), foundUser.getPassword());
                System.out.println("입력된 비밀번호와 암호화된 비밀번호 일치 여부: " + isPasswordMatch);

                if (isPasswordMatch) {
                    // 세션 설정 확인
                	session.setAttribute("user_id", memberVO.getUser_id());
                    session.setAttribute("loginStatus", "ok");
                    session.setAttribute("userInfo", foundUser);
                    
                    System.out.println("로그인 성공: 세션 설정 완료");
                    
                    mv.addObject("alertMessage", "로그인 성공!");
                    mv.setViewName("redirect:/index");
                } else {
                    // 비밀번호 불일치 시 처리
                    System.out.println("로그인 실패: 비밀번호 불일치");
                    mv.addObject("loginStatus", "fail");
                    mv.addObject("alertMessage", "로그인 실패: 비밀번호가 일치하지 않습니다.");
                    mv.setViewName("login/login");
                }
            } else {
                // 사용자 정보가 없을 때 처리
                System.out.println("로그인 실패: 사용자 정보 없음");
                mv.addObject("loginStatus", "fail");
                mv.addObject("alertMessage", "로그인 실패: 사용자 정보가 없습니다.");
                mv.setViewName("login/login");
            }
        } catch (Exception e) {
            // 예외 발생 시 로그 출력
            System.out.println("로그인 중 예외 발생: " + e);
            e.printStackTrace();
            mv.addObject("loginStatus", "error");
            mv.addObject("alertMessage", "로그인 중 오류가 발생했습니다.");
            mv.setViewName("login/login");
        }
        return mv;
    }
    
    
    // 아이디 찾기 페이지로 이동
    @GetMapping("/find_id")
    public ModelAndView findIdForm() {
        ModelAndView mv = new ModelAndView("mainlogin/loginf");  // 아이디 찾기 페이지 (loginf.jsp)
        return mv;
    }

 // 비밀번호 찾기 페이지로 이동
    @GetMapping("/find_password")
    public ModelAndView findPasswordForm() {
        ModelAndView mv = new ModelAndView("mainlogin/find_password");  // 비밀번호 찾기 페이지 (find_password.jsp)
        return mv;
    }

    
 // 아이디 찾기 처리
    @PostMapping("/loginf_ok")
    public ModelAndView findUserId(MemberVO memberVO, HttpSession session) {
        // ModelAndView 객체 생성 (뷰와 데이터를 함께 반환하기 위해 사용)
        ModelAndView mv = new ModelAndView();
        try {
        	  // 디버깅을 위한 로그 추가
            System.out.println("입력된 username: " + memberVO.getUsername());
            System.out.println("입력된 email: " + memberVO.getEmail());
        	
            // MemberService를 사용하여 사용자의 아이디를 찾음
            // memberService.findUserId(memberVO)는 memberVO 객체의 정보를 바탕으로 데이터베이스에서 해당 아이디를 조회
            MemberVO foundUser = memberService.findUserId(memberVO);
            
            // 찾은 유저 정보 출력 (디버깅용)
            System.out.println("foundUser 결과: " + foundUser);
            
            
            // 아이디가 조회된 경우
            if (foundUser != null) {
                // 성공적으로 찾은 아이디가 있는 경우, "loginf_ok" 뷰로 이동
                mv.setViewName("mainlogin/loginf_ok");
                // 뷰에서 사용할 데이터로 찾은 user_id를 추가
                mv.addObject("user_id", foundUser.getUser_id());
            } else {
                // 찾는 아이디가 없을 경우
                mv.setViewName("login/login");
                // 뷰에 "일치하는 아이디가 없습니다."라는 메시지를 추가
                mv.addObject("message", "일치하는 아이디가 없습니다.");
            }
        } catch (Exception e) {
            // 예외 발생 시, 스택 트레이스를 출력하여 오류 정보를 확인
            e.printStackTrace();
        }
        // ModelAndView 객체를 반환하여 뷰와 데이터를 전달
        return mv;
    }

    // 비밀번호 찾기 처리
    @PostMapping("/find_password_change")
    public ModelAndView findUserPassword(MemberVO memberVO, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        try {
            MemberVO foundUser = memberService.findUserPassword(memberVO);
            if (foundUser != null) {
                mv.setViewName("mainlogin/find_password_change");
                session.setAttribute("userId", foundUser.getUser_id());
            } else {
                mv.setViewName("mainlogin/find_password");
                mv.addObject("message", "일치하는 정보가 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
    // 비밀번호 업데이트 처리
    @PostMapping("/update_password")
    public ModelAndView updatePassword(@RequestParam("newPassword") String newPassword, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String userId = (String) session.getAttribute("userId");
        if (userId != null) {
            try {
                String encodedPassword = passwordEncoder.encode(newPassword);
                int updateCount = memberService.updatePassword(userId, encodedPassword);
                System.out.println("업데이트된 행의 수: " + updateCount);  // 업데이트 결과 확인용

                // DB에 업데이트된 결과 확인
                MemberVO updatedUser = memberService.loginCheck(userId);
                System.out.println("DB에 반영된 암호화된 비밀번호: " + updatedUser.getPassword());

                mv.addObject("alertMessage", "비밀번호가 성공적으로 변경되었습니다. 로그인 해주세요.");
                mv.setViewName("login/login");
            } catch (Exception e) {
                e.printStackTrace();
                mv.setViewName("find_password");
                mv.addObject("message", "비밀번호 업데이트 중 오류가 발생했습니다. 다시 시도해 주세요.");
            }
        } else {
            mv.setViewName("find_password");
            mv.addObject("message", "세션이 만료되었습니다. 다시 시도해 주세요.");
        }
        return mv;
    }
    


 // 로그아웃 처리
    
    @GetMapping("/user_logout") 
    public String logoutUser(HttpSession session) {
    session.invalidate(); // 세션 무효화하여 로그아웃 처리 // 세션 속성을 확인하는 로그 메시지 제거
    System.out.println("로그아웃 처리 완료"); 
    return "redirect:/user_login"; // 로그아웃 후 로그인
 
    }
    
    @PostMapping("/checkPassword")
    public ModelAndView checkPassword(@RequestParam("password") String password, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        try {
            // 세션에서 로그인된 사용자 정보를 가져옴
            MemberVO loggedInUser = (MemberVO) session.getAttribute("userInfo");

            if (loggedInUser == null) {
                mv.addObject("alertMessage", "로그인이 필요합니다.");
                mv.setViewName("loginform2222");
                return mv;
            }

            // 현재 비밀번호와 일치하는지 확인
            boolean isPasswordMatch = passwordEncoder.matches(password, loggedInUser.getPassword());

            if (isPasswordMatch) {
                // 비밀번호가 일치하면 다음 페이지로 이동
                mv.setViewName("redirect:/update"); // 다음 페이지로 변경하세요
            } else {
                // 비밀번호가 일치하지 않으면 경고 메시지 추가
                mv.addObject("alertMessage", "현재 비밀번호가 일치하지 않습니다.");
                mv.setViewName("updateProfile"); // 현재 페이지로 유지
            }
        } catch (Exception e) {
            e.printStackTrace();
            mv.addObject("alertMessage", "오류가 발생했습니다. 다시 시도해 주세요.");
            mv.setViewName("updateProfile");
        }
        return mv;
    }

    
    
 
}

 
