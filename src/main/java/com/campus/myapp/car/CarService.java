package com.campus.myapp.car;

import java.util.List;

public interface CarService {
	public List<CarVO> carList();
	public int carInsert(CarVO vo);
	public CarVO carSelect(int no);
	public int carInfoCount(int no);
	public CarVO carEdit(int no);
	public int carEditOk(CarVO vo);
	public int carDelete(int no);
	
	public int replyWrite(CarVO vo);
	public int replyCountSelect(int no);
	public List<CarReplyVO> replyList(int no);
	public int replyEdit(CarVO vo);
	public int replyDel(int no);
}
