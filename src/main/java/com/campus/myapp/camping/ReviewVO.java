package com.campus.myapp.camping;

import java.util.List;

public class ReviewVO {

	private int reviewno;
	private int contentId;
	private String nickname; 
	private String content;
	private String createdate;
	private String recommend;
	
	private List<Integer> reviewNoList;
	
	public List<Integer> getReviewNoList() {
		return reviewNoList;
	}
	public void setReviewNoList(List<Integer> reviewNoList) {
		this.reviewNoList = reviewNoList;
	}
	public int getReviewno() {
		return reviewno;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}
	public int getContentId() {
		return contentId;
	}
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	
	
}
