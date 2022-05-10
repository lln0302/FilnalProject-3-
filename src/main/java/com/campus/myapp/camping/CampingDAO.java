package com.campus.myapp.camping;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CampingDAO {
		
	//�������� ���
	public int addplace(CampingVO vo);	
	
	//�� ���ڵ� �� ���ϱ�
	public int totalRecord(Paging10VO pvo);

	public List<CampingVO> campingSearch(Paging10VO pVO);
			
}