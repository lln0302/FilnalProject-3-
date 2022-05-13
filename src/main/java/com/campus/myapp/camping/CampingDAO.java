package com.campus.myapp.camping;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CampingDAO {
		
	//가게정보 등록
	public int addplace(CampingVO vo);	
	
	//총 레코드 수
	public int totalRecord(Paging10VO pvo);

	//캠핑장 목록(search)
	public List<CampingVO> campingSearch(Paging10VO pVO);
	
	//캠핑장 목록(suggestion)
	public List<CampingVO> campingSuggestion(Paging10VO pVO);	
	
	//캠핑장 선택
	public CampingVO campingSelect(String contentId);
			
}