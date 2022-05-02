package com.campus.myapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/gather/")
@RestController
public class GatherController {

	ModelAndView mav = new ModelAndView();
	
	// 캠퍼 모임 커뮤니티 리스트
	@GetMapping("/gatherList")
	public ModelAndView GatherList() {
		mav.setViewName("gather/gatherList");
		return mav;
	}
	
	// 캠퍼 모임 커뮤니티 글 작성 폼
	@GetMapping("/gatherWrite")
	public ModelAndView GatherWrite() {
		mav.setViewName("gather/gatherWrite");
		return mav; 
	}
}
