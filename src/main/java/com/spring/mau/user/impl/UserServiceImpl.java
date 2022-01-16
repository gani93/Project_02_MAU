package com.spring.mau.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.user.UserService;
import com.spring.mau.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO getUser(UserVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return userDAO.getUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		// TODO 자동 생성된 메소드 스텁
		userDAO.insertUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		// TODO 자동 생성된 메소드 스텁
		userDAO.updateUser(vo);
		
	}
	@Override
	public UserVO mypageGetUser(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.mypageGetUser(vo);
	}
	@Override
	public UserVO getDetail(UserVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return userDAO.getDetail(vo);
	}

}
