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

	//ķ���� ���(search)
	public List<CampingVO> campingSearch(Paging10VO pVO);
	
	//ķ���� ���(tag)
	public List<CampingVO> campingTag(Paging10VO pVO);
	
	//ķ���� ���(suggestion)
	public List<CampingVO> campingSuggestion(Paging10VO pVO);	
	
	//ķ���� ����
	public CampingVO campingSelect(String contentId);
			
}