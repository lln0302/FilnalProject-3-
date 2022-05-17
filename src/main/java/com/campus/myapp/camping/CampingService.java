package com.campus.myapp.camping;

import java.util.List;

public interface CampingService {
	public int addplace(CampingVO vo);
	public int addimages(CampingVO vo);
	public int totalRecord(Paging10VO pvo);
	public List<CampingVO> campingSearch(Paging10VO pVO);	
	public CampingVO campingSelect(String contentId);
	public List<CampingVO> campingSuggestion(Paging10VO pVO);
	public List<CampingVO> campingTag(Paging10VO pVO);
	public CampingVO campingViewReview(String contentId);	
}