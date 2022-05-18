package com.campus.myapp.camping;

import java.util.List;

public interface CampingService {
	
	   // 캠핑장정보 등록
	   public int addplace(CampingVO vo);
	   
	   // 캠핑장 이미지 등록
	   public int addimages(CampingVO vo);
	   
	   // 총 레코드 수
	   public int totalRecord(Paging10VO pvo);

	   // 캠핑장 목록(search)
	   public List<CampingVO> campingSearch(Paging10VO pVO);
	   
	   // 캠핑장 목록(tag)
	   public List<CampingVO> campingTag(Paging10VO pVO);
	         
	   // 캠핑장 선택
	   public List<CampingVO> campingSelect(String contentId);
	   
	   // 캠핑장 선택(리뷰)
	   public CampingVO campingReview(String contentId);
	   
	   // 캠핑장 목록(suggestion)
	   public List<CampingVO> campingSuggestion(Paging10VO pVO);
	  
	   // 지향 - 후기목록
	   public List<ReviewVO> reviewListSelect(int contentId);
}