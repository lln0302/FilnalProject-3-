package com.campus.myapp.car;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/car/")
public class CarController {
	
	@Inject
	CarService service;

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
	
	
	// 차박게시판 글 등록
	@PostMapping("carWriteOk")
	public ModelAndView carWriteOk(CarVO vo) {
		ModelAndView mav = new ModelAndView();
		
		
		int rst = service.carWriteOk(vo);
		
		mav.setViewName("car/carInfo");
		return mav;
	}
	
}
