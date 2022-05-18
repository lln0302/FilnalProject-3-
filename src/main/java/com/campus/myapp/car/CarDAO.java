package com.campus.myapp.car;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CarDAO {
	// 차박 게시판 목록 가져오기
	public List<CarVO> carList();
	
	// 차박 게시판 글 등록
	public int carInsert(CarVO vo);
	
	// 차박 게시판 게시물내용 가져오기
	public CarVO carSelect(int no);
	
	// 차박 게시판 게시물 조회수 증가
	public int carInfoCount(int no);
	
	// 차박 게시판 게시물 삭제
	public int carDelete(int no);
	
	// 댓글 처리 부분
	public int replyWrite(CarVO vo);
	public int replyCountSelect(int no);
	public List<CarReplyVO> replyList(int no);
	public int replyEdit(CarVO vo);
	public int replyDel(int no);
}
