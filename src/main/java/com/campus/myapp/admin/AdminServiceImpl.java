package com.campus.myapp.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.member.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDAO dao;

    @Override
    public List<MemberVO> adminMembers(AdminPagingVO apvo) {
        return dao.adminMembers(apvo);
    }
    
	@Override
	public List<GatherVO> adminAddCamperList(AdminPagingVO apvo) {
		return dao.adminAddCamperList(apvo);
	}
	
	@Override
	public List<MemberVO> allList(AdminPagingVO apvo) {
		return dao.allList(apvo);
	}
	
	@Override
	public int totalRecordMembers(AdminPagingVO apvo) {
		return dao.totalRecordMembers(apvo);
	}

	@Override
	public int totalRecordGather(AdminPagingVO apvo) {
		return dao.totalRecordGather(apvo);
	}
}
