package com.campus.myapp.gather;

import java.util.List;

public interface GatherService {

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
	
	// 캠퍼 참여
	public int plusGatherCamper(int gatherno); // gatherDB
	public int gathermemberInsert(int gmemberno, int gatherno, String nickname, 
			String gender); // gathermemberDB
	
	// 켐퍼 참여 취소 
	public int minusGatherCamper(int gatherno);
	
	// 댓글 등록
	public int replyWrite(ReplyVO vo);
	// 댓글 리스트
	public List<ReplyVO> replyList(int gatherno);
	// 댓글 수정
	public int replyEdit(ReplyVO vo);
	// 댓글 삭제
	public int replyDel(int replyno);
	// 뷰페이지 댓글 개수
	public int replyCountSelect(int gatherno);
	

}
