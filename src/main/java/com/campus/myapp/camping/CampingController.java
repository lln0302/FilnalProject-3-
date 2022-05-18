package com.campus.myapp.camping;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.core.net.SyslogOutputStream;
import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

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
	
	@GetMapping("/campingTag")
	public ModelAndView campingTag(Paging10VO pVO) {
		ModelAndView mav = new ModelAndView();
		
		//레코드수
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		//DB에서 캠핑장 리스트 가져오기		
		mav.addObject("list", service.campingTag(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("camping/campingTag");
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
	
	@PostMapping("addimages")
	public int addimages(@RequestBody CampingVO[] result) {
		int n=0;
		try {
			for(CampingVO vo:result) {
				n += service.addimages(vo);
			}
		}catch(Exception e) {
			
		}
		return n;
	}
	
	@GetMapping("/campingView")
	public ModelAndView campingView(String contentId) {
		 
		ModelAndView mav = new ModelAndView();
		 List<CampingVO> list=service.campingSelect(contentId);
		
		mav.addObject("vo",list); 
		
		mav.setViewName("camping/campingView");
		
		return mav;
	}

	@GetMapping("/campingSuggestion")
	public ModelAndView CampingSuggestion(Paging10VO pVO) {
		ModelAndView mav = new ModelAndView();		
				
		mav.addObject("list", service.campingSuggestion(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("camping/campingSuggestion");
		return mav;
	}
	
	// 지향 - 캠핑 리뷰 리스트 
	@GetMapping("/reviewList")
	public List<ReviewVO> campingViewReview(int contentId, HttpSession session) {
		return service.reviewListSelect(contentId);
	}
	
}	
