package com.campus.myapp.supply;

import java.util.List;

public interface SupplyService {
	public List<SupplyVO> supplyList();
	public int supplyInfoCount(int no);
	public SupplyVO supplySelect(int no);
	public int supplyInsert(SupplyVO vo);
	public int supplyEditOk(SupplyVO vo);
	public int supplyDelete(int no);
}
