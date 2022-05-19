package com.campus.myapp.camping;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CampingServiceImpl implements CampingService {
	@Inject
	CampingDAO dao;

	@Override
	public int addplace(CampingVO vo) {
		return dao.addplace(vo);
	}
	
	@Override
	public int totalRecord(Paging10VO pvo) {		
		return dao.totalRecord(pvo);
	}

	@Override
	public List<CampingVO> campingSearch(Paging10VO pVO) {		
		return dao.campingSearch(pVO);
	}

	@Override
	public List<CampingVO> campingSelect(String contentId) {
		return dao.campingSelect(contentId);
	}

	@Override
	public List<CampingVO> campingSuggestion(Paging10VO pVO) {
		return dao.campingSuggestion(pVO);
	}

	@Override
	public List<CampingVO> campingTag(Paging10VO pVO) {
		return dao.campingTag(pVO);
	}

	@Override
	public int addimages(CampingVO vo) {
		return dao.addimages(vo);
	}

	// ���� - ���丮��Ʈ
	@Override
	public List<ReviewVO> reviewListSelect(int contentId) {
	   return dao.reviewListSelect(contentId);
	}
	
	// ���� - ������
	@Override
	public int reviewInsert(ReviewVO vo) {
	   return dao.reviewInsert(vo);
	}
	
	// ���� - ����
	@Override
	public ReviewVO reviewModalSelect(int reviewno) {
	   return dao.reviewModalSelect(reviewno);
	}
	// ���� - �������
	@Override
	public int reviewUpdate(ReviewVO vo) {
	   return dao.reviewUpdate(vo);
	}
	
	// ���� - �������
	@Override
	public int reviewDelete(int reviewno) {
	   return dao.reviewDelete(reviewno);
	}
}