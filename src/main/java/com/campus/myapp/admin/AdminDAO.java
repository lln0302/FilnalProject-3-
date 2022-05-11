package com.campus.myapp.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.member.MemberVO;

@Mapper
@Repository
public interface AdminDAO {
	//adminMembers (Admins and Users)
	public List<MemberVO> adminMembers(AdminPagingVO apvo);
	
	//adminAddCamperList (Together Camper Finding)
	public List<GatherVO> adminAddCamperList(AdminPagingVO apvo);
	
	//adminPage List Test
	public List<MemberVO> allList(AdminPagingVO apvo);
	
	//adminPaging total record
	public int totalRecordMembers(AdminPagingVO apvo);
	public int totalRecordGather(AdminPagingVO apvo);
}
