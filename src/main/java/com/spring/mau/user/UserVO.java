package com.spring.mau.user;

public class UserVO {
	private String userId;
	private int adminNum;
	private int userSeqId;
	private String userNickName;
	private String userInform;
	private String userIcon;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}
	public int getUserSeqId() {
		return userSeqId;
	}
	public void setUserSeqId(int userSeqId) {
		this.userSeqId = userSeqId;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserInform() {
		return userInform;
	}
	public void setUserInform(String userInform) {
		this.userInform = userInform;
	}
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", adminNum=" + adminNum + ", userSeqId=" + userSeqId + ", userNickName="
				+ userNickName + ", userInform=" + userInform + ", userIcon=" + userIcon + "]";
	}
	
	
}
