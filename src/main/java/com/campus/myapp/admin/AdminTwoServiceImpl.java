package com.campus.myapp.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.member.MemberVO;

@Service
public class AdminTwoServiceImpl implements AdminTwoService {
    @Autowired
    AdminTwoDAO dao2;

	@Override
	public List<AdminTwoCampListVO> adminCampList(AdminTwoPagingVO apvo) {
		return dao2.adminCampList(apvo);
	}

	@Override
	public int totalRecord(AdminTwoPagingVO apvo) {
		return dao2.totalRecord(apvo);
	}
    
	
}
