package com.campus.myapp.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;


@Controller
//@RestController
@RequestMapping("/admin/*")
public class AdminController {

	
	@Autowired
	AdminService service;
	
	
	//관리자페이지 메인페이지
	@GetMapping("adminMain")
	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/adminMain");
		return mav;
	}
	
	//관리자페이지 회원목록
	@GetMapping("adminMembers")
	public ModelAndView adminMembers(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecord(apvo));
				
		//DB connect
		mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminMembers");
		return mav;
	}
	
	//관리자페이지 캠핑장목록
	@GetMapping("adminCampList")
	public ModelAndView adminCampList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecord(apvo));
				
		//DB connect
		mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminCampList");
		return mav;
	}
	
	//관리자페이지 캠퍼모집목록
	@GetMapping("adminAddCamperList")
	public ModelAndView adminAddCamperList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecord(apvo));
				
		//DB connect
		mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminAddCamperList");
		return mav;
	}
	
	//관리자페이지 차박지공유목록
	@GetMapping("adminAutoCampList")
	public ModelAndView adminAutoCampList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecord(apvo));
				
		//DB connect
		mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminAutoCampList");
		return mav;
	}
	
	//관리자페이지 캠핑용품나눔목록
	@GetMapping("adminShareList")
	public ModelAndView adminShareList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecord(apvo));
				
		//DB connect
		mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminShareList");
		return mav;
	}
	
	//관리자페이지 후기목록
	@GetMapping("adminReviewList")
	public ModelAndView adminReviewList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecord(apvo));
				
		//DB connect
		mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminReviewList");
		return mav;
	}
	
	//관리자페이지 댓글목록
	@GetMapping("adminCommentList")
	public ModelAndView adminCommentList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecord(apvo));
				
		//DB connect
		mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminCommentList");
		return mav;
	}
	
	//관리자페이지 테스트
	@GetMapping("adminTestList")
	public ModelAndView testList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecord(apvo));
				
		//DB connect
		mav.addObject("list", service.allList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/test");
		return mav;
	}
	
}
