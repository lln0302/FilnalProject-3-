package com.campus.myapp.gather;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class GatherServiceImpl implements GatherService {

	@Inject
	GatherDAO dao;

	// 캠퍼 모집 리스트
	@Override
	public List<GatherVO> gatherList(PagingVO pvo, GatherVO vo) {
		return dao.gatherList(pvo, vo);
	}

	@Override
	public int selectTotalPosts(PagingVO pvo, GatherVO vo) {
		return dao.selectTotalPosts(pvo, vo);
	}
	
}
