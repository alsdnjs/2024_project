package com.ict.manager.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.manager.manager.service.ManagerService;
import com.ict.manager.manager.vo.ManagerVO;

@Controller
public class ManagerLoginController {
	@Autowired
	private ManagerService guestBook2Service;
	
	@PostMapping("/login")
    public ModelAndView login(@RequestParam("manager_id") String manager_id, 
                              @RequestParam("manager_pw") String manager_pw, 
                              @RequestParam("manager_type") String manager_type, 
                              HttpSession session) {
        ModelAndView mv = new ModelAndView();
        ManagerVO manager = guestBook2Service.getManagerById(manager_id);

        if (manager != null && manager.getManager_pw().equals(manager_pw)
        		&& manager.getManager_type().equals(manager_type)) {
            session.setAttribute("manager_name", manager.getManager_name());
            session.setAttribute("manager_id", manager.getManager_id());
            session.setAttribute("manager_type", manager.getManager_type());
            if (manager_type.equalsIgnoreCase("super")) {
            	mv.setViewName("redirect:/manager_list");
				
			} else {
				mv.setViewName("manager/manager/manager_common_list");
			}
        } else {
        	mv.addObject("loginchk", "0");
            mv.setViewName("firstin");
            mv.addObject("error", "Invalid ID or password");
        }
        return mv;
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        return new ModelAndView("firstin");
    }
}
