package com.spring.mau.place;

public class PlaceVO {
	private int placeSeq, placeId,userSeqId;
	private String  placeName, placeAddr;
	private double placeSouthWest, placeNorthEast;
	public int getPlaceSeq() {
		return placeSeq;
	}
	public void setPlaceSeq(int placeSeq) {
		this.placeSeq = placeSeq;
	}
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public int getUserSeqId() {
		return userSeqId;
	}
	public void setUserSeqId(int userSeqId) {
		this.userSeqId = userSeqId;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getPlaceAddr() {
		return placeAddr;
	}
	public void setPlaceAddr(String placeAddr) {
		this.placeAddr = placeAddr;
	}
	public double getPlaceSouthWest() {
		return placeSouthWest;
	}
	public void setPlaceSouthWest(double placeSouthWest) {
		this.placeSouthWest = placeSouthWest;
	}
	public double getPlaceNorthEast() {
		return placeNorthEast;
	}
	public void setPlaceNorthEast(double placeNorthEast) {
		this.placeNorthEast = placeNorthEast;
	}
	
	
}
