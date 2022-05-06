package com.campus.myapp.gather;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/gather/")
@RestController
public class GatherController {

	@Inject
	GatherService service;
	
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	// 캠퍼 모임 커뮤니티 리스트
	@GetMapping("/gatherList")
	/*
	 * public ModelAndView GatherList(PagingVO pvo, GatherVO vo, HttpSession
	 * session) {
	 * 
	 * vo.setNickname((String)session.getAttribute("nickname"));
	 * 
	 * // 게시판 글 페이징처리 pvo.setTotalPosts(service.selectTotalPosts(pvo, vo));
	 * mav.addObject("pvo", pvo);
	 * 
	 * mav.addObject("list", service.gatherList(pvo, vo));
	 * mav.setViewName("gather/gatherList"); return mav; }
	 */
	public ModelAndView GatherList() {
		mav.setViewName("gather/gatherList");
		return mav; 
	}
	
	// 캠퍼 모임 커뮤니티 글등록 폼
	@GetMapping("/gatherWrite")
	public ModelAndView GatherWrite() {
		mav.setViewName("gather/gatherWrite");
		return mav; 
	}
	
	// 캠퍼 모임 글등록 DB연결
	@PostMapping("/gatherWriteOk")
	public ModelAndView GatherWriteOk(GatherVO vo, HttpServletRequest request) {

		// 현재 session에 있는 nickname
		vo.setNickname((String)request.getSession().getAttribute("nickname"));
		
		return mav;
	}
	
	// 캠퍼 모임 상세페이지 
	@GetMapping("/gatherView")
	public ModelAndView GatherView() {
		mav.setViewName("gather/gatherView");
		return mav;
	}
}
