package com.campus.myapp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberDAO dao;

    @Override
    public MemberVO loginCheck(MemberVO vo) {
        return dao.loginCheck(vo);
    }
}
