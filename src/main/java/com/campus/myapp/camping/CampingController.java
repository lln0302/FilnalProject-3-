package com.campus.myapp.camping;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/camping/")
@RestController
public class CampingController {
	@Inject
	CampingService service;	
	
	@GetMapping("/campingSearch")
	public ModelAndView CampingSearch(Paging10VO pVO) {
		ModelAndView mav = new ModelAndView();
		System.out.println(service.totalRecord(pVO));
		//레코드수
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		//DB에서 캠핑장 리스트 가져오기		
		mav.addObject("list", service.campingSearch(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("camping/campingSearch");
		return mav;
	}
	
	@PostMapping("addplace")
	public int addplace(@RequestBody CampingVO[] result) {
		int n=0;
		try {
			for(CampingVO vo:result) {
				n += service.addplace(vo);
			}
		}catch(Exception e) {
			
		}
		return n;
	}
	
	@GetMapping("campingView")
	public ModelAndView campingView(String contentId) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.campingSelect(contentId));
		mav.setViewName("camping/campingView");
		
		return mav;
	}
	
	@GetMapping("campingSuggestion")
	public ModelAndView CampingSuggestion() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("camping/campingSuggestion");
		return mav;
	}
}	
