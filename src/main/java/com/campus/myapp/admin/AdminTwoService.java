package com.campus.myapp.admin;

import java.util.List;

import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.member.MemberVO;

public interface AdminTwoService {
	//adminCampList (Camping place Finding)
	public List<AdminTwoCampListVO> adminCampList(AdminTwoPagingVO apvo);

	public int totalRecord(AdminTwoPagingVO apvo);
	
}
