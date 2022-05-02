package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/car/")
public class CarController {

	/* 22-04-29 오어진 추가부분*/
	@GetMapping("carList")
	public ModelAndView carList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("car/carList");
		return mav;
	}
	
	@GetMapping("carWrite")
	public ModelAndView carWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("car/carWrite");
		return mav;
	}
	
	
	
	///////////////////////////////////////
	
}
