package com.campus.myapp.supply;

public class ChatVO {
	private int roomno;
	private int supplyno;
	private String masterNickname;
	private String clientNickname;
	private String content;
	private String writedate;
	
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	public int getSupplyno() {
		return supplyno;
	}
	public void setSupplyno(int supplyno) {
		this.supplyno = supplyno;
	}
	public String getMasterNickname() {
		return masterNickname;
	}
	public void setMasterNickname(String masterNickname) {
		this.masterNickname = masterNickname;
	}
	public String getClientNickname() {
		return clientNickname;
	}
	public void setClientNickname(String clientNickname) {
		this.clientNickname = clientNickname;
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
	@Override
	public String toString() {
		return "ChatVO [roomno=" + roomno + ", supplyno=" + supplyno + ", masterNickname=" + masterNickname
				+ ", clientNickname=" + clientNickname + ", content=" + content + ", writedate=" + writedate + "]";
	}
	
	
}
