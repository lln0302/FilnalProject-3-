package com.campus.myapp.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.member.MemberVO;
@Mapper
@Repository
public interface AdminDAO {
	
	//관리자페이지 회원목록 보기
	/*
	public List<MemberVO> adminMembers();
	*/
	/*
	
	//관리자페이지 캠핑장목록 보기
	public List<CampVO> adminCampList();
	
	//관리자페이지 캠퍼모집목록 보기
	public List<MemberVO> adminAddCamperList();
	
	//관리자페이지 차박지공유목록 보기
	public List<???> adminAutoCampList();
	
	//관리자페이지 캠핑용품나눔목록 보기
	public List<MemberVO> adminShareList();
	
	//관리자페이지 후기목록 보기
	public List<ReviewVO> adminReviewList();
	
	//관리자페이지 댓글목록 보기
	public List<CommentVO> adminCommentList();
	
	*/
}
