package com.campus.myapp.member;

import java.util.List;

public class MemberVO {
    private String userid;
    private String username;
    private String nickname;
    private String userpwd;
    private String usertel;
    private String usertel1;
    private String usertel2;
    private String usertelP;
    private String birth;
    private String gender;
    private String email;
    private String joindate;
    private String isadmin;
    private String userscore;
    private String zzim_zzimno;

    
    private List<Integer> telList;

	public List<Integer> getTelList() {
		return telList;
	}

	public void setTelList(List<Integer> telList) {
		this.telList = telList;
	}

	public String getUsertel1() {
        return usertel1;
    }

    public void setUsertel1(String usertel1) {
        this.usertel1 = usertel1;
    }

    public String getUsertel2() {
        return usertel2;
    }

    public void setUsertel2(String usertel2) {
        this.usertel2 = usertel2;
    }

    public String getUsertelP() {
        return usertelP;
    }
    public void setUsertelP(String usertelP) {
        this.usertelP = usertelP;
    }
    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public String getUsertel() {
        usertel = usertel1+usertel2;
        return usertel;
    }

    public void setUsertel(String usertel) {
        usertel1 = usertel.substring(0, 3);
        usertel2 = usertel.substring(3);
        this.usertel = usertel;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getJoindate() {
        return joindate;
    }

    public void setJoindate(String joindate) {
        this.joindate = joindate;
    }

    public String getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(String isadmin) {
        this.isadmin = isadmin;
    }

    public String getUserscore() {
        return userscore;
    }

    public void setUserscore(String userscore) {
        this.userscore = userscore;
    }

    public String getZzim_zzimno() {
        return zzim_zzimno;
    }

    public void setZzim_zzimno(String zzim_zzimno) {
        this.zzim_zzimno = zzim_zzimno;
    }
}
