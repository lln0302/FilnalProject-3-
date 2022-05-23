package com.campus.myapp.supply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class SupplyServiceImpl implements SupplyService {
	
	@Inject
	SupplyDAO dao;

	@Override
	public List<SupplyVO> supplyList(SupplyPagingVO pvo, SupplyVO vo) {
		return dao.supplyList(pvo, vo);
	}
	
	@Override
	public int selectTotalSupply() {
		return dao.selectTotalSupply();
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

	
	@Override
	public int chatWrite(ChatVO vo) {
		return dao.chatWrite(vo);
	}

	@Override
	public int chatCountSelect(int suuplyno) {
		return dao.chatCountSelect(suuplyno);
	}
	
	@Override
	public List<ChatVO> chatList(int supplyno) {
		return dao.chatList(supplyno);
	}

	@Override
	public int chatDel(int roomno) {
		return dao.chatDel(roomno);
	}

	@Override
	public ChatVO chatSelect(int roomno) {
		return dao.chatSelect(roomno);
	}

	@Override
	public int chatSend(ChatVO vo) {
		return dao.chatSend(vo);
	}

	

	

	

	

}
