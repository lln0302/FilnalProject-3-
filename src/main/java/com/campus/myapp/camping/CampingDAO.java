package com.campus.myapp.camping;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CampingDAO {
		
	//�������� ���
	public int addplace(CampingVO vo);	
	
	//�� ���ڵ� ��
	public int totalRecord(Paging10VO pvo);

	//ķ���� ���
	public List<CampingVO> campingSearch(Paging10VO pVO);
	
	//ķ���� ����
	public CampingVO campingSelect(String contentId);
			
}