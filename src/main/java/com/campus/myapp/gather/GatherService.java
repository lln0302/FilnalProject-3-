package com.campus.myapp.gather;

import java.util.List;

public interface GatherService {

	// 캠퍼 모집 글 등록
	public int gatherInsert(GatherVO vo);
	
	// 캠퍼 모집 리스트
	public List<GatherVO> gatherList(PagingVO pvo, GatherVO vo);

	// 게시판의 레코드 개수 
	public int selectTotalPosts(PagingVO pvo, GatherVO vo);
}
