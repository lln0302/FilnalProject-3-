package com.campus.myapp.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.camping.CampingVO;
import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.gather.ReplyVO;
import com.campus.myapp.member.MemberVO;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;


@Controller
//@RestController
@RequestMapping("/admin/*")
public class AdminController {

	
	@Autowired
	AdminService service;
	
	//-------------------------------------------------------------//
	
	//관리자페이지 메인페이지
	@GetMapping("adminMain")
	public ModelAndView adminMain(AdminTagVO atvo) {
		ModelAndView mav = new ModelAndView();
		
		//캠핑장 태그1
		atvo.setTagAnimal(service.tagAnimal(atvo));
		atvo.setTagHotwater(service.tagHotwater(atvo));
		atvo.setTagElectric(service.tagElectric(atvo));
		atvo.setTagPool(service.tagPool(atvo));
		atvo.setTagWifi(service.tagWifi(atvo));
		atvo.setTagMart(service.tagMart(atvo));
		atvo.setTagPlayGround(service.tagPlayGround(atvo));
		atvo.setTagGym(service.tagGym(atvo));
		atvo.setTagFishing(service.tagFishing(atvo));
		atvo.setTagBeach(service.tagBeach(atvo));
		
		//캠핑장 태그2
		atvo.setTagSpring(service.tagSpring(atvo));
		atvo.setTagSummer(service.tagSummer(atvo));
		atvo.setTagFall(service.tagFall(atvo));
		atvo.setTagwinter(service.tagwinter(atvo));
		
		//캠퍼모집 태그
		atvo.setTagOne(service.tagOne(atvo));
		atvo.setTagTwo(service.tagTwo(atvo));
		atvo.setTagThree(service.tagThree(atvo));
		atvo.setTagFour(service.tagFour(atvo));
		atvo.setTagFive(service.tagFive(atvo));
		atvo.setTagSixMoreThan(service.tagSixMoreThan(atvo));
		atvo.setTagTenMoreThan(service.tagTenMoreThan(atvo));
		
		//차박지 지역 태그
		
		
		mav.addObject("atvo", atvo);
		mav.setViewName("/admin/adminMain");
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 회원목록
	@GetMapping("adminMembers")
	public ModelAndView adminMembers(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordMembers(apvo));
				
		//DB connect
		mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminMembers");
		return mav;
	}
	
	//관리자페이지 회원삭제 (여러개)
	@PostMapping("adminMembersDel")
	public ModelAndView adminMembersDel(MemberVO mvo) {
		ModelAndView mav = new ModelAndView();
		service.adminMembersDel(mvo);
		mav.setViewName("redirect:adminMembers");
		
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 캠핑장목록
	@GetMapping("adminCampList")
	public ModelAndView adminCampList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordCampingList(apvo));
		
		//DB connect
		mav.addObject("list", service.adminCampList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminCampList");
		return mav;
	}
	//관리자페이지 캠핑장삭제 (여러개)
	@PostMapping("adminCampListDel")
	public ModelAndView adminCampListDel(CampingVO cvo) {
		ModelAndView mav = new ModelAndView();
		service.adminCampListDel(cvo);
		mav.setViewName("redirect:adminCampList");
		
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 캠퍼모집목록
	@GetMapping("adminAddCamperList")
	public ModelAndView adminAddCamperList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordGather(apvo));
				
		//DB connect
		mav.addObject("list", service.adminAddCamperList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminAddCamperList");
		return mav;
	}
	//관리자페이지 캠핑장삭제 (여러개)
	@PostMapping("adminAddCamperListDel")
	public ModelAndView adminCampListDel(GatherVO gvo) {
		ModelAndView mav = new ModelAndView();
		service.adminAddCamperListDel(gvo);
		mav.setViewName("redirect:adminAddCamperList");
		
		return mav;
	}
	//-------------------------------------------------------------//
	
	//관리자페이지 차박지공유목록
	@GetMapping("adminAutoCampList")
	public ModelAndView adminAutoCampList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordMembers(apvo));
				
		//DB connect
		//mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminAutoCampList");
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 캠핑용품나눔목록
	@GetMapping("adminShareList")
	public ModelAndView adminShareList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordMembers(apvo));
				
		//DB connect
		//mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminShareList");
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 후기목록
	@GetMapping("adminReviewList")
	public ModelAndView adminReviewList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordMembers(apvo));
				
		//DB connect
		//mav.addObject("list", service.adminMembers(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminReviewList");
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 댓글목록
	@GetMapping("adminCommentList")
	public ModelAndView adminCommentList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordReply(apvo));
				
		//DB connect
		mav.addObject("list", service.adminCommentList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminCommentList");
		return mav;
	}
	//관리자페이지 댓글삭제 (여러개)
	@PostMapping("adminCommentListDel")
	public ModelAndView adminCommentListDel(ReplyVO rvo) {
		ModelAndView mav = new ModelAndView();
		service.adminCommentListDel(rvo);
		mav.setViewName("redirect:adminCommentList");
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 테스트
	@GetMapping("adminTestList")
	public ModelAndView testList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordMembers(apvo));
		
		//DB connect
		mav.addObject("list", service.allList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/test");
		return mav;
	}
	

	
}
