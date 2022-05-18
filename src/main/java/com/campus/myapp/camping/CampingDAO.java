package com.campus.myapp.camping;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CampingDAO {
		
	//罹좏븨�옣�젙蹂� �벑濡�
	public int addplace(CampingVO vo);
	
	//罹좏븨�옣 �씠誘몄� �벑濡�
	public int addimages(CampingVO vo);
	
	//珥� �젅肄붾뱶 �닔
	public int totalRecord(Paging10VO pvo);

	//罹좏븨�옣 紐⑸줉(search)
	public List<CampingVO> campingSearch(Paging10VO pVO);
	
	//罹좏븨�옣 紐⑸줉(tag)
	public List<CampingVO> campingTag(Paging10VO pVO);
			
	//캠핑장 선택
	public List<CampingVO> campingSelect(String contentId);

	//罹좏븨�옣 紐⑸줉(suggestion)
	public List<CampingVO> campingSuggestion(Paging10VO pVO);			
}