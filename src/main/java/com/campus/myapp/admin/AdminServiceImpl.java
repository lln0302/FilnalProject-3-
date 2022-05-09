package com.campus.myapp.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDAO dao;

    @Override
    public List<AdminMemberVO> adminMembers(AdminPagingVO apvo) {
        return dao.adminMembers(apvo);
    }
	@Override
	public List<AdminMemberVO> allList(AdminPagingVO apvo) {
		return dao.allList(apvo);
	}
	@Override
	public int totalRecord(AdminPagingVO apvo) {
		return dao.totalRecord(apvo);
	}


}
