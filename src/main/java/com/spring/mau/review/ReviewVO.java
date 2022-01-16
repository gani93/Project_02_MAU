package com.spring.mau.review;

public class ReviewVO {
	private int placeSeq;
	private String review;
	private int userSeqId;
	private String placeState;
	public int getReviewSeq() {
		return reviewSeq;
	}
	public void setReviewSeq(int reviewSeq) {
		this.reviewSeq = reviewSeq;
	}
	private int reviewSeq;
	
	public int getPlaceSeq() {
		return placeSeq;
	}
	public void setPlaceSeq(int placeSeq) {
		this.placeSeq = placeSeq;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public int getUserSeqId() {
		return userSeqId;
	}
	public void setUserSeqId(int userSeqId) {
		this.userSeqId = userSeqId;
	}
	public String getPlaceState() {
		return placeState;
	}
	public void setPlaceState(String placeState) {
		this.placeState = placeState;
	}
	

	
}
