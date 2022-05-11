package com.campus.myapp.supply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/supply/")
public class SupplyController {
	
	@GetMapping("supplyList")
	public ModelAndView supplyList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("supply/supplyList");
		return mav;
	}
	
	@GetMapping("supplyInfo")
	public ModelAndView supplyInfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("supply/supplyInfo");
		return mav;
	}
	
	@GetMapping("supplyWrite")
	public ModelAndView supplyWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("supply/supplyWrite");
		return mav;
	}
	
	@GetMapping("supplyChat")
	public ModelAndView supplyChat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("supply/supplyChat");
		return mav;
	}
}
