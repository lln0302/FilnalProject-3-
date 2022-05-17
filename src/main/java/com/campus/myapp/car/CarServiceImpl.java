package com.campus.myapp.car;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl implements CarService {
	
	@Inject
	CarDAO dao;

	
	@Override
	public List<CarVO> carSelect() {
		return dao.carSelect();
	}
	
	@Override
	public int carInsert(CarVO vo) {
		return dao.carInsert(vo);
	}
	
}
