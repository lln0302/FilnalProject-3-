package com.campus.myapp.gather;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class GatherServiceImpl implements GatherService {

	@Inject
	GatherDAO dao;

	// 캠퍼 모집 글 등록
	@Override
	public int gatherInsert(GatherVO vo) {
		return dao.gatherInsert(vo);
	}
	// 캠퍼 모집 리스트
	@Override
	public List<GatherVO> gatherList(PagingVO pvo, GatherVO vo) {
		return dao.gatherList(pvo, vo);
	}
	// 게시판의 레코드 개수 
	@Override
	public int selectTotalPosts(PagingVO pvo, GatherVO vo) {
		return dao.selectTotalPosts(pvo, vo);
	}
	// 게시판의 상세페이지
	@Override
	public GatherVO gatherView(int gatherno) {
		return dao.gatherView(gatherno);
	}
	
	// 조회수 증가
	@Override
	public int updateViews(int gatherno) {
		return dao.updateViews(gatherno);
	}

	// 캠퍼 참여
	@Override
	public int plusGatherCamper(int gatherno) { // gatherDB
		return dao.plusGatherCamper(gatherno);  // gathermemberDB
	}
	@Override
	public int gathermemberInsert(int gmemberno, int gatherno, String nickname, String gender) {
		return dao.gathermemberInsert(gmemberno, gatherno, nickname, gender);
	}
	// 캠퍼 참여 취소
	@Override
	public int minusGatherCamper(int gatherno) {
		return dao.minusGatherCamper(gatherno);
	}

	// 댓글 등록
	@Override
	public int replyWrite(ReplyVO vo) {
		return dao.replyWrite(vo);
	}
	// 댓글 리스트
	@Override
	public List<ReplyVO> replyList(int gatherno) {
		return dao.replyList(gatherno);
	}
	// 댓글 수정
	@Override
	public int replyEdit(ReplyVO vo) {
		return dao.replyEdit(vo);
	}
	// 댓글 삭제
	@Override
	public int replyDel(int replyno) {
		return dao.replyDel(replyno);
	}
	// 뷰페이지 댓글 개수
	@Override
	public int replyCountSelect(int gatherno) {
		return dao.replyCountSelect(gatherno);
	}

}
