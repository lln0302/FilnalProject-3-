package com.campus.myapp.gather;

public class ReplyVO {

	private int replyno;
	private String content;
	private String writedate;
	private String nickname;
	private int gatherno;
	
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getGatherno() {
		return gatherno;
	}
	public void setGatherno(int gatherno) {
		this.gatherno = gatherno;
	}
}