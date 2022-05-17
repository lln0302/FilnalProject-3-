package com.campus.myapp.car;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CarDAO {
	// ���� �Խ��� ��� ��������
	public List<CarVO> carSelect();
	
	// ���� �Խ��� �� ���
	public int carInsert(CarVO vo);
}
