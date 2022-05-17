package com.campus.myapp.car;

import java.util.List;

public interface CarService {
	public List<CarVO> carSelect();
	public int carInsert(CarVO vo);
}
