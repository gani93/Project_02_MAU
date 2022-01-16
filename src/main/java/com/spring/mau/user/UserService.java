package com.spring.mau.user;


public interface UserService {
	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);
	void updateUser(UserVO vo);
	UserVO getDetail(UserVO vo);
	UserVO mypageGetUser(UserVO vo);
}
