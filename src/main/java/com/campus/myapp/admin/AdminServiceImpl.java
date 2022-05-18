package com.campus.myapp.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.myapp.camping.CampingVO;
import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.gather.ReplyVO;
import com.campus.myapp.member.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDAO dao;
    
    //adminMain (dashBoard) (campingList tag ranking)
  	public int tagAnimal(AdminTagVO atvo) {							//#반려견동반
  		return dao.tagAnimal(atvo);
  	}
  	public int tagHotwater(AdminTagVO atvo) {						//#온수
  		return dao.tagHotwater(atvo);
  	}
	public int tagElectric(AdminTagVO atvo) {							//#전기
  		return dao.tagElectric(atvo);
  	}
  	public int tagPool(AdminTagVO atvo) {							//#수영장
  		return dao.tagPool(atvo);
  	}
  	public int tagWifi(AdminTagVO atvo) {							//#무선인터넷
  		return dao.tagWifi(atvo);
  	}
  	public int tagMart(AdminTagVO atvo) {							//#마트
  		return dao.tagMart(atvo);
  	}
  	public int tagPlayGround(AdminTagVO atvo) {						//#놀이터
  		return dao.tagPlayGround(atvo);
  	}
  	public int tagGym(AdminTagVO atvo) {								//#운동장
  		return dao.tagGym(atvo);
  	}
  	public int tagFishing(AdminTagVO atvo) {							//#낚시
  		return dao.tagFishing(atvo);
  	}
  	public int tagBeach(AdminTagVO atvo) {							//#해수욕
  		return dao.tagBeach(atvo);
  	}
  	public int tagSpring(AdminTagVO atvo) {							//#봄
  		return dao.tagSpring(atvo);
  	}
  	public int tagSummer(AdminTagVO atvo) {							//#여름
  		return dao.tagSummer(atvo);
  	}
  	public int tagFall(AdminTagVO atvo) {							//#가을
  		return dao.tagFall(atvo);
  	}
  	public int tagwinter(AdminTagVO atvo) {							//#겨울
  		return dao.tagwinter(atvo);
  	}
  	
  	//adminMain (dashBoard) (addCamperList tag ranking)
  	public int tagOne(AdminTagVO atvo) {								//#1명
  		return dao.tagOne(atvo);
  	}
  	public int tagTwo(AdminTagVO atvo) {								//#2명
  		return dao.tagTwo(atvo);
  	}
  	public int tagThree(AdminTagVO atvo) {							//#3명
  		return dao.tagThree(atvo);
  	}
  	public int tagFour(AdminTagVO atvo) {							//#4명
  		return dao.tagFour(atvo);
  	}
  	public int tagFive(AdminTagVO atvo) {							//#5명
  		return dao.tagFive(atvo);
  	}
  	public int tagSixMoreThan(AdminTagVO atvo) {						//#6명이상 (6~9명)
  		return dao.tagSixMoreThan(atvo);
  	}
  	public int tagTenMoreThan(AdminTagVO atvo) {						//#10명이상 (그외 전부)
  		return dao.tagTenMoreThan(atvo);
  	}
  	
  	
  	//adminMain (dashBoard) (autoCampList tag ranking) (임시)
  	//public int tagSeoul(CarVO carvo);
  	//public int tagGyungi(CarVO carvo);
  	//public int tag다른지역 없으려나?
    
    //-------------------------------------------------------------//
    
    //adminMembers (member)
	@Override
	public int totalRecordMembers(AdminPagingVO apvo) {				//member TotalRecord
		return dao.totalRecordMembers(apvo);
	}
    @Override
    public List<MemberVO> adminMembers(AdminPagingVO apvo) {		//membersList
        return dao.adminMembers(apvo);
    }
    @Override
    public int adminMembersDel(MemberVO mvo) {						//membersDel
    	return dao.adminMembersDel(mvo);
    }
	
    //-------------------------------------------------------------//
    
    //adminCampList (Campinglist)
	@Override
	public int totalRecordCampingList(AdminPagingVO apvo) {			//campinglist TotalRecord
		return dao.totalRecordCampingList(apvo);
	}
    @Override
	public List<CampingVO> adminCampList(AdminPagingVO apvo) {		//campList
    	return dao.adminCampList(apvo);
    }
    @Override
	public int adminCampListDel(CampingVO cvo) {					//campListDel
    	return dao.adminCampListDel(cvo);
    }
    
    //-------------------------------------------------------------//
    
    //adminAddCamperList (gather)
	@Override
	public int totalRecordGather(AdminPagingVO apvo) {				//gather TotalRecord
		return dao.totalRecordGather(apvo);
	}
	@Override
	public List<GatherVO> adminAddCamperList(AdminPagingVO apvo) {	//addCamperList
		return dao.adminAddCamperList(apvo);
	}
	@Override
	public int adminAddCamperListDel (GatherVO gvo) {				//adminAddCamperListDel
		return dao.adminAddCamperListDel(gvo);
	}
	
    //-------------------------------------------------------------//
	
	////adminReviewList (review)
	@Override
	public int totalRecordReview (AdminPagingVO apvo) {				//review TotalRecord
		return dao.totalRecordReview(apvo);
	}
	
	
	//-------------------------------------------------------------//
	
	//adminCommentList (gatherReply)
	@Override
	public int totalRecordReply(AdminPagingVO apvo) {				//reply TotalRecord
		return dao.totalRecordReply(apvo);
	}
	@Override
	public List<ReplyVO> adminCommentList(AdminPagingVO apvo) {		//adminCommentList
		return dao.adminCommentList(apvo);
	}
	@Override
	public int adminCommentListDel(ReplyVO rvo) {					//adminCommentListDel
		return dao.adminCommentListDel(rvo);
	}
	
    //-------------------------------------------------------------//
	
	//adminPage List Test
	@Override
	public List<MemberVO> allList(AdminPagingVO apvo) {				//testList
		return dao.allList(apvo);
	}


	




}
