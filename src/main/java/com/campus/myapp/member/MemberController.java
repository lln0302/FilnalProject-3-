package com.campus.myapp.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@Controller
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    MemberService service;

    @GetMapping("loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("loginOk")
    public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session, HttpServletRequest request) throws ParseException {
        ResponseEntity<String> entity = null;
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "text/html; charset=utf-8");
        try {
            MemberVO rVO = service.loginCheck(vo);
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
            } else {
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
    @GetMapping("logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        return mav;
    }
}
