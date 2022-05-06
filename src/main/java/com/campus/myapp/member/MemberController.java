package com.campus.myapp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;

@Controller
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    MemberService memberservice;

    //로그인 페이지 이동
    @GetMapping("loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    //로그인 및 홈페이지 섹션 표시
    @PostMapping("loginOk")
    public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session, HttpServletRequest request) throws ParseException {
        ResponseEntity<String> entity = null;
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "text/html; charset=utf-8");
        try {
            MemberVO rVO = memberservice.loginCheck(vo);
            session.setAttribute("userid", rVO.getUserid());
            session.setAttribute("nickname", rVO.getNickname());
            session.setAttribute("logStatus", "Y");
            session.setAttribute("isadmin", rVO.getIsadmin());
            String msg = "";
            if (rVO.getIsadmin().equals("1")) {
                msg = "<script>location.href='/admin/adminMain';<script>";
            } else if (rVO.getIsadmin().equals("0")) {
                String dest = (String) session.getAttribute("dest");
                String redirect = (dest == null) ? "/" : dest;
                msg = "<script>location.href='" + redirect + "';</script>";
            }else {
                throw new Exception();
            }
            entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            String msg = "<script>alert('로그인 실패');history.go(-1);</script>";
            entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
    //로그아웃
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        return mav;
    }
    //회원가입 페이지
    @GetMapping("memberForm")
    public String memberForm() {
        return "member/memberForm";
    }
    @PostMapping("memberOk")
    public String memberFormOk(MemberVO vo, Model model) {
        int cnt = memberservice.memberInsert(vo);
        model.addAttribute("cnt", cnt);
        return "member/memberResult";
    }
    @GetMapping("/phoneCheck")
    @ResponseBody
    public String sendSMS(@RequestParam("usertel") String usertel) {
        int randomNumber = (int)((Math.random() * (9999 - 1000 + 1)) + 1000);
        memberservice.certifiedPhone(usertel, randomNumber);
        return Integer.toString(randomNumber);
    }
    @PostMapping("checkId")
    @ResponseBody
    public MemberVO checkId (@RequestBody MemberVO vo) {
        return memberservice.checkId(vo);
    }
    @PostMapping("checkNick")
    @ResponseBody
    public MemberVO checkNick (@RequestBody MemberVO vo) {
        return memberservice.checkNick(vo);
    }
    @PostMapping("checkTel")
    @ResponseBody
    public MemberVO checkTel (@RequestBody MemberVO vo) {
        return memberservice.checkTel(vo);
    }
}
