package com.campus.myapp.car;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CarDAO {
	// 차박 게시판 목록 가져오기
	public List<CarVO> carSelect();
	
	// 차박 게시판 글 등록
	public int carInsert(CarVO vo);
}
