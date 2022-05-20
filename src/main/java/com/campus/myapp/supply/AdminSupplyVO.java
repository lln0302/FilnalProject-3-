package com.campus.myapp.supply;

import java.util.List;

public class AdminSupplyVO {
	
	private int supplyno;
	private String title;
	private String nickname;
	private String writedate;
	private String content;
	
	private List<Integer> supplyNoList;

	public int getSupplyno() {
		return supplyno;
	}

	public void setSupplyno(int supplyno) {
		this.supplyno = supplyno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<Integer> getSupplyNoList() {
		return supplyNoList;
	}

	public void setSupplyNoList(List<Integer> supplyNoList) {
		this.supplyNoList = supplyNoList;
	}
	
}
