package com.ict.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AjaxtController {
	
	@GetMapping("/project_test")
	public ModelAndView ajaxTest4() {
		return new ModelAndView("/test_result");
	}
}
