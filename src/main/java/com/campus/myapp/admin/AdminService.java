package com.campus.myapp.admin;

import java.util.List;

public interface AdminService {
	//adminMembers (admins and users)
	public List<AdminMemberVO> adminMembers(AdminPagingVO apvo);
	
	//adminPage List Test
	public List<AdminMemberVO> allList(AdminPagingVO apvo);
	
	//adminPaging total record
	public int totalRecord(AdminPagingVO apvo);
}
