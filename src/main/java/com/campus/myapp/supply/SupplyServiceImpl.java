package com.campus.myapp.supply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class SupplyServiceImpl implements SupplyService {
	
	@Inject
	SupplyDAO dao;

	@Override
	public List<SupplyVO> supplyList() {
		return dao.supplyList();
	}
	
	@Override
	public int supplyInfoCount(int no) {
		return dao.supplyInfoCount(no);
	}

	@Override
	public SupplyVO supplySelect(int no) {
		return dao.supplySelect(no);
	}
	
	@Override
	public int supplyInsert(SupplyVO vo) {
		return dao.supplyInsert(vo);
	}
	
	@Override
	public int supplyEditOk(SupplyVO vo) {
		return dao.supplyEditOk(vo);
	}

	@Override
	public int supplyDelete(int no) {
		return dao.supplyDelete(no);
	}

	

	

	

}
