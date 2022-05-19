package com.campus.myapp.car;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl implements CarService {
	
	@Inject
	CarDAO dao;

	
	@Override
	public List<CarVO> carList() {
		return dao.carList();
	}
	
	@Override
	public int carInsert(CarVO vo) {
		return dao.carInsert(vo);
	}

	@Override
	public CarVO carSelect(int no) {
		return dao.carSelect(no);
	}

	@Override
	public int carInfoCount(int no) {
		return dao.carInfoCount(no);
	}
	
	@Override
	public CarVO carEdit(int no) {
		return dao.carEdit(no);
	}
	
	@Override
	public int carEditOk(CarVO vo) {
		return dao.carEditOk(vo);
	}
	
	@Override
	public int carDelete(int no) {
		return dao.carDelete(no);
	}
	
	
	

	@Override
	public int replyWrite(CarVO vo) {
		return dao.replyWrite(vo);
	}

	@Override
	public int replyCountSelect(int no) {
		return dao.replyCountSelect(no);
	}

	@Override
	public List<CarReplyVO> replyList(int no) {
		return dao.replyList(no);
	}

	@Override
	public int replyEdit(CarVO vo) {
		return dao.replyEdit(vo);
	}

	@Override
	public int replyDel(int no) {
		return dao.replyDel(no);
	}

	

	

	
	
}
