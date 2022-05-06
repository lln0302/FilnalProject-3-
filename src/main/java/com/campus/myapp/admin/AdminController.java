package com.campus.myapp.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/admin/*")
public class AdminController {

	/*
	@Inject
	AdminService service;
	*/
	
	@GetMapping("adminMain")
	public String adminMain() {
		return "/admin/adminMain";	//어드민메인
	}
	
	/*@GetMapping("adminSignIn")
	public String adminSignIn() {
		return "/admin/adminSignIn";	//로그인 (임시)
	}*/
	
	@GetMapping("adminMembers")
	public String adminMembers() {
		return "/admin/adminMembers"; //회원목록 임시
	}
	/*
	@GetMapping("adminMembers")
	public ModelAndView adminMembers() {
		ModelAndView mav = new ModelAndView();
		//mav.addObject("lst", adsv.adminMembers());
		mav.setViewName("admin/adminMembers");
		return mav;	//회원목록
	}*/
	/*
	@GetMapping("")
	public List<MemberVO> adminMembers(){ //메소드명 jsp명과 동일
		
	}
	*/
	@GetMapping("adminCampList")
	public String adminCampList() {
		return "/admin/adminCampList";	//캠핑장목록
	}
	
	@GetMapping("adminAddCamperList")
	public String adminAddCamperList() {
		return "/admin/adminAddCamperList";	//캠퍼모집목록
	}
	
	@GetMapping("adminAutoCampList")
	public String adminAutoCampList() {
		return "/admin/adminAutoCampList";	//차박지공유목록
	}
	
	@GetMapping("adminShareList")
	public String adminShareList() {
		return "/admin/adminShareList";	//캠핑용품나눔목록
	}
	
	@GetMapping("adminReviewList")
	public String adminReviewList() {
		return "/admin/adminReviewList";	//후기목록
	}
	
	@GetMapping("adminCommentList")
	public String adminCommentList() {
		return "/admin/adminCommentList";	//댓글목록
	}
}
