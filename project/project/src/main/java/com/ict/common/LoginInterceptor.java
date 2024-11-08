package com.ict.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 세션에서 로그인 상태 확인
        HttpSession session = request.getSession(false); // 기존 세션이 없으면 null 반환
        Object loginStatus = (session != null) ? session.getAttribute("loginStatus") : null;

        if (loginStatus == null || !"ok".equals(loginStatus)) { // 로그인 상태가 아닐 때
            String script = "<script>alert('로그인이 필요합니다'); location.href='/user_login'; </script>";
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write(script);
            return false; // Controller로 요청이 가지 않도록 차단
        }
        return true; // 로그인 상태일 때 Controller로 요청 진행
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // 요청 처리 후 추가 작업 필요 시 구현
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // 요청 완료 후 추가 작업 필요 시 구현
    }
}
