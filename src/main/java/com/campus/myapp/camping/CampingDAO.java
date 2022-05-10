package com.campus.myapp.camping;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CampingDAO {
		
	//가게정보 등록
	public int addplace(CampingVO vo);	
	
	//총 레코드 수 구하기
	public int totalRecord(Paging10VO pvo);

	public List<CampingVO> campingSearch(Paging10VO pVO);
			
}