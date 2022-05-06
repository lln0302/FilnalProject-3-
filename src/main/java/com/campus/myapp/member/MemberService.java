package com.campus.myapp.member;

public interface MemberService {
    public MemberVO loginCheck(MemberVO vo);
    public int memberInsert(MemberVO vo);
    public void certifiedPhone(String usertel, int randomNumber);

    public MemberVO checkId(MemberVO vo);
    public MemberVO checkNick(MemberVO vo);
    public MemberVO checkTel(MemberVO vo);
}
