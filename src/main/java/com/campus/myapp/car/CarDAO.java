package com.campus.myapp.car;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CarDAO {
	// ���� �Խ��� ��� ��������
	public List<CarVO> carList();
	
	// ���� �Խ��� �� ���
	public int carInsert(CarVO vo);
	
	// ���� �Խ��� �Խù����� ��������
	public CarVO carSelect(int no);
	
	// ���� �Խ��� �Խù� ��ȸ�� ����
	public int carInfoCount(int no);
	
	// ���� �Խ��� �Խù� ����
	public int carDelete(int no);
	
	// ��� ó�� �κ�
	public int replyWrite(CarVO vo);
	public int replyCountSelect(int no);
	public List<CarReplyVO> replyList(int no);
	public int replyEdit(CarVO vo);
	public int replyDel(int no);
}
