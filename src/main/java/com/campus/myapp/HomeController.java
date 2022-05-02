package com.campus.myapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeController {
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	
	
	/* 22-04-29 ������ �ӽ��߰��κ�*/
	@GetMapping("/car/carList")
	public ModelAndView carList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("car/carList");
		return mav;
	}
	
	
	
	///////////////////////////////////////
}
