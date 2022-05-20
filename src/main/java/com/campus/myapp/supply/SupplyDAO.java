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
}
