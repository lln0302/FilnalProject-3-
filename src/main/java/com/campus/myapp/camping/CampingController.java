package com.campus.myapp.camping;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/camping/")
@RestController
public class CampingController {
	ModelAndView mav = new ModelAndView();
	
	@GetMapping("/campingSearch")
	public ModelAndView CampingSearch() {
		mav.setViewName("camping/campingSearch");
		return mav;
	}
}	
