package com.campus.myapp.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.member.MemberVO;

@Mapper
@Repository
public interface AdminTwoDAO {
	//adminCampList (Camping place Finding)
	public List<AdminTwoCampListVO> adminCampList(AdminTwoPagingVO apvo);
	public int totalRecord(AdminTwoPagingVO apvo);
}
