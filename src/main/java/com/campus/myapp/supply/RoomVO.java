package com.campus.myapp.supply;

public class RoomVO {
	private int roomNumber;
	private String roomName;
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	@Override
	public String toString() {
		return "RoomVO [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
	}
}
