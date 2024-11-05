package com.ict.popup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
public class PopupController {

    // 팝업 표시 여부를 확인하는 메서드
    @GetMapping("/popup/allowed")
    @ResponseBody
    public boolean isPopupAllowed(
            @CookieValue(value = "noPopup", defaultValue = "false") String noPopup) {
        return !noPopup.equals("true");
    }

    // "오늘 하루 보지 않기" 클릭 시 쿠키 설정
    @PostMapping("/popup/disable")
    @ResponseBody
    public void disablePopup(HttpServletResponse response) {
        Cookie cookie = new Cookie("noPopup", "true");
        cookie.setMaxAge(24 * 60 * 60); // 하루 동안 유지
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}
