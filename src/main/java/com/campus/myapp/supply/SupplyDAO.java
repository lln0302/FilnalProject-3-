package com.campus.myapp.supply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SupplyDAO {
	// 나눔 게시판 리스트 가져오기
	public List<SupplyVO> supplyList();
	// 나눔 게시판 조회수 증가
	public int supplyInfoCount(int no);
	// 나눔 게시판 특정 글 불러오기
	public SupplyVO supplySelect(int no);
	// 나눔 게시판 글 작성 처리
	public int supplyInsert(SupplyVO vo);
	// 나눔 게시판 글 수정 처리
	public int supplyEditOk(SupplyVO vo);
	// 나눔 게시판 글 삭제
	public int supplyDelete(int no);
	
	// 채팅방 생성하기
	public int chatWrite(ChatVO vo);
	// 채팅방 개수 가져오기
	public int chatCountSelect(int suuplyno);
	// 채팅방 목록 가져오기
	public List<ChatVO> chatList(int supplyno);
	// 채팅방 삭제하기
	public int chatDel(int roomno);
	// 해당 채팅방 정보 불러오기
	public ChatVO chatSelect(int roomno);
	// 채팅내용 바로바로 db에 저장
	public int chatSend(ChatVO vo);
}
