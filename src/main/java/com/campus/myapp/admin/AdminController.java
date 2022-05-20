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
import com.campus.myapp.camping.ReviewVO;
import com.campus.myapp.car.CarReplyVO;
import com.campus.myapp.car.CarVO;
import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.gather.ReplyVO;
import com.campus.myapp.member.MemberVO;
import com.campus.myapp.supply.AdminSupplyVO;
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
		atvo.setTagSeoul(service.tagSeoul(atvo));
		atvo.setTagGyunggy(service.tagGyunggy(atvo));
		atvo.setTagGangwon(service.tagGangwon(atvo));
		atvo.setTagChoongbook(service.tagChoongbook(atvo));
		atvo.setTagChoongnam(service.tagChoongnam(atvo));
		atvo.setTagJeonbook(service.tagJeonbook(atvo));
		atvo.setTagJeonnam(service.tagJeonnam(atvo));
		atvo.setTagGyeongbook(service.tagGyeongbook(atvo));
		atvo.setTagGyeongnam(service.tagGyeongnam(atvo));
		atvo.setTagJeju(service.tagJeju(atvo));
		
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
	//관리자페이지 회원목록 상세보기
	@GetMapping("adminMembersInfo")
	public ModelAndView adminMembersInfo(String nickname) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("infoVO", service.adminMembersInfo(nickname));
		mav.setViewName("/admin/adminMembersInfo");
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
		apvo.setTotalRecord(service.totalRecordCar(apvo));
				
		//DB connect
		mav.addObject("list", service.adminAutoCampList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminAutoCampList");
		return mav;
	}
	//관리자페이지 캠핑장삭제 (여러개)
	@PostMapping("adminAutoCampListDel")
	public ModelAndView adminAutoCampListDel(CarVO cvo) {
		ModelAndView mav = new ModelAndView();
		service.adminAutoCampListDel(cvo);
		mav.setViewName("redirect:adminAutoCampList");
		
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 캠핑용품나눔목록
	@GetMapping("adminShareList")
	public ModelAndView adminShareList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordSupply(apvo));
				
		//DB connect
		mav.addObject("list", service.adminShareList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminShareList");
		return mav;
	}
	//관리자페이지 캠핑용품나눔목록 삭제
	@PostMapping("adminShareListDel")
	public ModelAndView adminShareListDel(AdminSupplyVO svo) {
		ModelAndView mav = new ModelAndView();
		service.adminShareListDel(svo);
		mav.setViewName("redirect:adminShareList");
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 후기목록
	@GetMapping("adminReviewList")
	public ModelAndView adminReviewList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordReview(apvo));
				
		//DB connect
		mav.addObject("list", service.adminReviewList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminReviewList");
		return mav;
	}
	
	//관리자페이지 캠퍼모집목록-댓글삭제
	@PostMapping("adminReviewListtDel")
	public ModelAndView adminReviewListDel(ReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		service.adminReviewListDel(rvo);
		mav.setViewName("redirect:adminReviewList");
		return mav;
	}
	
	//-------------------------------------------------------------//
	
	//관리자페이지 캠퍼모집목록-댓글목록
	
	@GetMapping("adminGatherCommentList")
	public ModelAndView adminGatherCommentList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordGatherReply(apvo));
				
		//DB connect
		mav.addObject("list", service.adminGatherCommentList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminGatherCommentList");
		return mav;
	}
	//관리자페이지 차박지공유목록-댓글목록
	@GetMapping("adminCarCommentList")
	public ModelAndView adminCarCommentList(AdminPagingVO apvo) {
		ModelAndView mav = new ModelAndView();
		//totalRecord numbers
		apvo.setTotalRecord(service.totalRecordCarReply(apvo));
				
		//DB connect
		mav.addObject("list", service.adminCarCommentList(apvo));
		mav.addObject("apvo", apvo);
		mav.setViewName("/admin/adminCarCommentList");
		return mav;
	}
	
	//관리자페이지 캠퍼모집목록-댓글삭제
	@PostMapping("adminGatherCommentListDel")
	public ModelAndView adminGatherCommentListDel(ReplyVO rvo) {
		ModelAndView mav = new ModelAndView();
		service.adminGatherCommentListDel(rvo);
		mav.setViewName("redirect:adminGatherCommentList");
		return mav;
	}
	//관리자페이지 차박지공유목록-댓글삭제
	@PostMapping("adminCarCommentListDel")
	public ModelAndView adminCarCommentListDel(CarReplyVO rvo) {
		ModelAndView mav = new ModelAndView();
		service.adminCarCommentListDel(rvo);
		mav.setViewName("redirect:adminCarCommentList");
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
