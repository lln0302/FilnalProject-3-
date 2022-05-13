package com.campus.myapp.car;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl implements CarService {
	
	@Inject
	CarDAO dao;

	@Override
	public int carWriteOk(CarVO vo) {
		return dao.carWriteOk(vo);
	}

}
