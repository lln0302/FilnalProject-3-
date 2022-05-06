package com.campus.myapp.member;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
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

    @Override
    public int memberInsert(MemberVO vo) {
        return dao.memberInsert(vo);
    }

    @Override
    public MemberVO checkId(MemberVO vo) {
        return dao.checkId(vo);
    }

    @Override
    public MemberVO checkNick(MemberVO vo) {
        return dao.checkNick(vo);
    }

    @Override
    public MemberVO checkTel(MemberVO vo) {
        return dao.checkTel(vo);
    }

    @Override
    public void certifiedPhone(String usertel, int randomNumber) {
        DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCSSC8LMV8I9NEYM","GYJE4KVZGNINIHIP38IWH8UO3IL8KVXC","https://api.coolsms.co.kr");
        Message message = new Message();
        message.setFrom("01051282101");
        message.setTo(usertel);
        message.setText("[MulCamping] 인증번호는 " +randomNumber+ "입니다.");
        SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);
    }
}
