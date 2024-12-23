package com.ict.Login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.order.service.OrderService;
import com.ict.manager.order.vo.ManagerOrderVO;
import com.ict.member.service.MemberService;
import com.ict.member.vo.MemberVO;
import com.ict.products.service.ProductsService;
import com.ict.products.vo.ProductsVO;
import com.ict.saup.service.SaupService;
import com.ict.saup.vo.SaupVO;
import com.ict.shipping.service.ShippingService;
import com.ict.shipping.vo.ShippingVO;


@Controller
public class LoginController {
	@Autowired
	private ProductsService productsService;
	
	//1111
	@Autowired
	private OrderService orderService;
	
	@Autowired
    private MemberService memberService;

    @Autowired
    private SaupService saupService;
    
    @Autowired
    private ShippingService shippingService;
    
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
    
  //아이디 중복 1109 2시
    @PostMapping("/check_user_id_login")
    @ResponseBody
    public Map<String, Object> checkUserId(@RequestParam("user_id") String userId) {
        Map<String, Object> result = new HashMap<>();
        try {
            boolean isAvailable = memberService.isUserIdAvailable(userId);
            result.put("isAvailable", isAvailable);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("isAvailable", false);
        }
        return result;
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
                    session.setAttribute("user_role", foundUser.getUser_role());
                    session.setAttribute("user_idx", foundUser.getUser_idx());
                    
                    System.out.println("로그인 성공: 세션 설정 완료");
                    session.setAttribute("alertMessage", "경빈이네 오신것을 환영합니다!");
                    mv.setViewName("redirect:/index");

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
        ModelAndView mv = new ModelAndView();
        try {
            System.out.println("입력된 username: " + memberVO.getUsername());
            System.out.println("입력된 email: " + memberVO.getEmail());

            MemberVO foundUser = memberService.findUserId(memberVO);

            System.out.println("foundUser 결과: " + foundUser);

            if (foundUser != null) {
                mv.setViewName("mainlogin/loginf_ok");
                mv.addObject("user_id", foundUser.getUser_id());
            } else {
                mv.setViewName("mainlogin/loginf"); // 아이디 찾기 페이지로 다시 이동
                mv.addObject("errorMessage", "일치하는 이름과 이메일을 가진 사용자가 없습니다."); // 오류 메시지 전달// 오류 메시지 전달
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                // 비밀번호 찾기 실패 시 alertMessage 설정
                mv.setViewName("mainlogin/find_password");
                mv.addObject("alertMessage", "일치하는 정보가 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            mv.setViewName("mainlogin/find_password");
            mv.addObject("alertMessage", "오류가 발생했습니다. 다시 시도해주세요.");
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

    
    
 // 결제하기 
    
    @GetMapping("/paymentPage")
    public String showPaymentPage(@RequestParam("product_idx") int productIdx, @RequestParam("amount") double amount, Model model) {
        try {
            ProductsVO product = productsService.getProductById(productIdx);
            
            // 디버깅: productIdx가 잘 전달되는지 확인
            System.out.println("Received productIdx in Controller: " + productIdx);
            
            if (product == null) {
                System.out.println("Product not found for productIdx: " + productIdx);
            } else {
                System.out.println("Product found: " + product.getProduct_idx());
            }
            
            model.addAttribute("product", product);
            model.addAttribute("amount", (int) amount);  // 소수점 없이 정수 형태로 변환하여 전달
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "상품 정보를 불러오는 중 문제가 발생했습니다.");
        }
        return "toss/payment";
    }


    @GetMapping("/paymentSuccess")
    public String paymentSuccess(@RequestParam("orderName") String orderName,
                                 @RequestParam("amount") double amount,
                                 @RequestParam(value = "product_idx", defaultValue = "0") String productIdxStr,
                                 HttpSession session, Model model) {
        // product_idx 값을 로그로 출력하여 확인
        System.out.println("Received product_idxStr: " + productIdxStr);
        
        // String으로 받은 product_idx를 int로 변환
        int productIdx = Integer.parseInt(productIdxStr);
        System.out.println("Parsed productIdx: " + productIdx);

        // 세션에서 user_idx를 가져와 String으로 변환 후 저장
        String userIdStr = (String) session.getAttribute("user_idx");
        
        // userIdStr이 null이 아니면 int로 변환
        int userId = userIdStr != null ? Integer.parseInt(userIdStr) : 0;

        // 주문 객체 생성 및 설정
        ManagerOrderVO order = new ManagerOrderVO();
        order.setuser_idx(String.valueOf(userId));
        order.setproduct_idx(String.valueOf(productIdx));
        order.setTotal_amount(String.valueOf(amount));
        order.setStatus("결제 완료");
        order.setPayment_status("결제 완료");
        order.setQuantity("1");

        // 주문 정보를 데이터베이스에 저장
        orderService.saveOrder(order);
        
        // 지금 저장된 주문 ID 가져오기 (orders_idx)
        String savedOrderIdx = order.getOrders_idx(); 
        
        ShippingVO shipping = new ShippingVO();
        shipping.setOrders_idx(savedOrderIdx);
        shipping.setTracking_number("123456"); // 실제 추적 번호 값 설정
        shipping.setCarrier("우체국택배");       // 실제 운송 회사 값 설정
        shipping.setEstimated_delivery("2024-10-10 00:00:00");

        shippingService.insertShipping(shipping);


        // 저장 후 데이터베이스에서 생성된 order_idx 가져오기
        String orderIdx = order.getOrders_idx();  // 이제 자동 생성된 order_idx가 반환
        System.out.println("Saved order_idx: " + orderIdx);

        // 결제 성공 정보를 모델에 담기
        model.addAttribute("orderName", orderName);
        model.addAttribute("amount", amount);
        model.addAttribute("order_idx", orderIdx);  // order_idx도 모델에 추가하여 뷰에서 접근 가능

        return "toss/paymentSuccess";  // 결제 성공 페이지로 이동
    }


 
}

 
