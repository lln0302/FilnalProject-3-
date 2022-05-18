package com.campus.myapp.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);

    public MemberVO checkId(MemberVO vo);
    public MemberVO checkNick(MemberVO vo);
    public MemberVO checkTel(MemberVO vo);
    public MemberVO findUserid(MemberVO vo);
    public int memberUpdate(MemberVO vo);
    public int memberDelete(MemberVO vo);
    public MemberVO memberSelect(String userid);
    public MemberVO isValidEmail(MemberVO vo);
    public int findUserPwd(MemberVO vo);
}


