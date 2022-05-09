package com.campus.myapp.gather;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface GatherDAO {

	// 캠퍼 모집 글 등록
	public int gatherInsert(GatherVO vo);
	
	// 캠퍼 모집 리스트
	public List<GatherVO> gatherList(PagingVO pvo, GatherVO vo);

	// 게시판의 레코드 개수 
	public int selectTotalPosts(PagingVO pvo, GatherVO vo);
	
	// 게시판 상세페이지
	public GatherVO gatherView(int gatherno);
	
	// 조회수 증가
	public int updateViews(int gatherno);
}
