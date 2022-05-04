package com.campus.myapp.car;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/car/")
public class CarController {

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
	
	@GetMapping("carInfo")
	public ModelAndView carInfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("car/carInfo");
		return mav;
	}
	
	
}
