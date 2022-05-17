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
	// 게시판 수정페이지
	@Override
	public GatherVO selectEditView(int gatherno) {
		return dao.selectEditView(gatherno);
	}
	// 게시판 글 수정
	@Override
	public int updateEditView(GatherVO vo) {
		return dao.updateEditView(vo);
	}
	// 게시판 글 삭제
	@Override
	public int gatherDelete(int gatherno) {
		return dao.gatherDelete(gatherno);
	}
	// 조회수 증가
	@Override
	public int updateViews(int gatherno) {
		return dao.updateViews(gatherno);
	}

	// 캠퍼 참여
	// gatherDB
	@Override
	public int plusGatherCamper(int gatherno) { 
		return dao.plusGatherCamper(gatherno);  
	}
	// gathermemberDB
	@Override
	public int gathermemberInsert(int gmemberno, int gatherno, String nickname, String gender) {
		return dao.gathermemberInsert(gmemberno, gatherno, nickname, gender);
	}
	// 이미 캠핑 참여한 유저 
	@Override
	public GatherMemberVO selectJoinCamper(int gatherno, String nickname) {
		return dao.selectJoinCamper(gatherno, nickname);
	}
	// 특정 캠핑 캠퍼 리스트
	@Override
	public List<GatherVO> selectCamperList(GatherMemberVO vo) {
		return dao.selectCamperList(vo);
	}
	// 캠퍼 참여한 유저 명수
	@Override
	public int gnewnoCountSelect(int gatherno) {
		return dao.gnewnoCountSelect(gatherno);
	}
	// 캠퍼 참여 취소
	//gatherDB
	@Override
	public int minusGatherCamper(int gatherno) {
		return dao.minusGatherCamper(gatherno);
	}
	// gathermemberDB
	@Override
	public int gathermemberDel(int gatherno, String nickname) {
		return dao.gathermemberDel(gatherno, nickname);
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