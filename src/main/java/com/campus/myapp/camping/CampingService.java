package com.campus.myapp.camping;

import java.util.List;

public interface CampingService {
	
	   // api저장
	   public int addplace(CampingVO vo);
	   
	   // 이미지 저장
	   public int addimages(CampingVO vo);
	   
	   // 총 레코드
	   public int totalRecord(Paging10VO pvo);

	   // 캠핑서치
	   public List<CampingVO> campingSearch(Paging10VO pVO);
	   
	   // 캠핑서치(태그)
	   public List<CampingVO> campingTag(Paging10VO pVO);
	         
	   // 캠핑뷰
	   public List<CampingVO> campingSelect(String contentId);
	   
	   // 캠핑장 추천
	   public List<CampingVO> campingSuggestion(Paging10VO pVO);
	  
	   // 지향 - 후기목록
	   public List<ReviewVO> reviewListSelect(int contentId);
	   
	   // 지향 - 후기등록
	   public int reviewInsert(ReviewVO vo);
	   
	   // 지향 - 후기
	   public ReviewVO reviewModalSelect(int reviewno);
	   
	   // 지향 - 후기수정
	   public int reviewUpdate(ReviewVO vo);
	   
	   // 지향 - 후기삭제
	   public int reviewDelete(int reviewno);
}