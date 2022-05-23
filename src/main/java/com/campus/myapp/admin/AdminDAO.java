package com.campus.myapp.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.camping.CampingVO;
import com.campus.myapp.camping.ReviewVO;
import com.campus.myapp.car.CarReplyVO;
import com.campus.myapp.car.CarVO;
import com.campus.myapp.gather.GatherVO;
import com.campus.myapp.gather.ReplyVO;
import com.campus.myapp.member.MemberVO;
import com.campus.myapp.supply.AdminSupplyVO;

@Mapper
@Repository
public interface AdminDAO {
	
	//adminMain (dashBoard) (campingList tag ranking)
	public int tagAnimal(AdminTagVO atvo);								//#반려견동반
	public int tagHotwater(AdminTagVO atvo);							//#온수
	public int tagElectric(AdminTagVO atvo);							//#전기
	public int tagPool(AdminTagVO atvo);								//#수영장
	public int tagWifi(AdminTagVO atvo);								//#무선인터넷
	public int tagMart(AdminTagVO atvo);								//#마트
	public int tagPlayGround(AdminTagVO atvo);							//#놀이터
	public int tagGym(AdminTagVO atvo);									//#운동장
	public int tagFishing(AdminTagVO atvo);								//#낚시
	public int tagBeach(AdminTagVO atvo);								//#해수욕
	public int tagSpring(AdminTagVO atvo);								//#봄
	public int tagSummer(AdminTagVO atvo);								//#여름
	public int tagFall(AdminTagVO atvo);								//#가을
	public int tagwinter(AdminTagVO atvo);								//#겨울
	
	//adminMain (dashBoard) (addCamperList tag ranking)
	public int tagOne(AdminTagVO atvo);									//#1명
	public int tagTwo(AdminTagVO atvo);									//#2명
	public int tagThree(AdminTagVO atvo);								//#3명
	public int tagFour(AdminTagVO atvo);								//#4명
	public int tagFive(AdminTagVO atvo);								//#5명
	public int tagSixMoreThan(AdminTagVO atvo);							//#6명이상 (6~9명)
	public int tagTenMoreThan(AdminTagVO atvo);							//#10명이상 (그외 전부)
	
	//adminMain (dashBoard) (autoCampList tag ranking) (car camping)
	public int tagSeoul(AdminTagVO atvo);								//서울
	public int tagGyunggy(AdminTagVO atvo);								//경기
	public int tagGangwon(AdminTagVO atvo);								//강원
	public int tagChoongbook(AdminTagVO atvo);							//충북
	public int tagChoongnam(AdminTagVO atvo);							//충남
	public int tagJeonbook(AdminTagVO atvo);							//전북
	public int tagJeonnam(AdminTagVO atvo);								//전남
	public int tagGyeongbook(AdminTagVO atvo);							//경북
	public int tagGyeongnam(AdminTagVO atvo);							//경남
	public int tagJeju(AdminTagVO atvo);								//제주
	
	//adminMembers (member)
	public int totalRecordMembers(AdminPagingVO apvo);				//member TotalRecord
	public List<MemberVO> adminMembers(AdminPagingVO apvo); 		//membersList
	public int adminMembersDel(MemberVO mvo); 						//membersDel
	public MemberVO adminMembersInfo(String nickname);				//membersInfo
	
	//-------------------------------------------------------------//
	
	//adminCampList (Campinglist)
	public int totalRecordCampingList(AdminPagingVO apvo);			//campinglist TotalRecord
	public List<CampingVO> adminCampList(AdminPagingVO apvo);		//campList
	public int adminCampListDel(CampingVO cvo);						//campListDel
	
	//-------------------------------------------------------------//
	
	//adminAddCamperList (gather)
	public int totalRecordGather(AdminPagingVO apvo);				//gather TotalRecord
	public List<GatherVO> adminAddCamperList(AdminPagingVO apvo);	//addCamperList
	public int adminAddCamperListDel (GatherVO gvo);				//adminAddCamperListDel
	
	//-------------------------------------------------------------//
	
	//adminAutoCampList (car)
	public int totalRecordCar (AdminPagingVO apvo);					//Car TotalRecord
	public List<CarVO> adminAutoCampList (AdminPagingVO apvo);		//adminAutoCampList
	public int adminAutoCampListDel (CarVO cvo);					//adminAutoCampListDel
	
	//-------------------------------------------------------------//
	
	//adminShareList (supply)
	public int totalRecordSupply (AdminPagingVO apvo);					//share TotalRecord
	public List<AdminSupplyVO> adminShareList (AdminPagingVO apvo);		//shareList
	public int adminShareListDel (AdminSupplyVO svo);					//adminShareListDel
	
	//-------------------------------------------------------------//
	
	//adminReviewList (review)
	public int totalRecordReview (AdminPagingVO apvo);				//review TotalRecord
	public List<ReviewVO> adminReviewList (AdminPagingVO apvo);		//reviewList
	public int adminReviewListDel (ReviewVO rvo);					//adminReviewListDel
	
	//-------------------------------------------------------------//
	
	//adminCommentList (gatherReply)
	public int totalRecordGatherReply (AdminPagingVO apvo);					//totalRecordGatherReply
	public List<ReplyVO> adminGatherCommentList (AdminPagingVO apvo);		//adminGatherCommentList
	public int adminGatherCommentListDel(ReplyVO rvo);						//adminGatherCommentListDel
	
	//adminCommentList (carReply)
	public int totalRecordCarReply (AdminPagingVO apvo);					//totalRecordCarReply
	public List<CarReplyVO> adminCarCommentList (AdminPagingVO apvo);		//adminCarCommentList
	public int adminCarCommentListDel(CarReplyVO rvo);						//adminCarCommentListDel
	
	//-------------------------------------------------------------//
	
	//adminPage List Test
	public List<MemberVO> allList(AdminPagingVO apvo);				//testList
}