package com.spring.mau.userplace.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.userplace.UserPlaceService;
import com.spring.mau.userplace.UserPlaceVO;

@Service("userPlaceService")
public class UserPlaceServiceImpl implements UserPlaceService {

	@Autowired
	private UserPlaceDAO userPlaceDAO;
	@Override
	public void insertUserPlace(UserPlaceVO vo) {
		// TODO Auto-generated method stub
		userPlaceDAO.insertUserPlace(vo);
	}
	@Override
	public UserPlaceVO getUserPlaceMapSeq(UserPlaceVO vo) {
		// TODO Auto-generated method stub
		return userPlaceDAO.getUserPlaceMapSeq(vo);
	}
	@Override
	public void deleteUserPlace(UserPlaceVO vo) {
		// TODO Auto-generated method stub
		userPlaceDAO.deleteUserPlace(vo);
	}
	@Override
	public void deleteUserPlaceSeqMapSeq(UserPlaceVO vo) {
		// TODO Auto-generated method stub
		userPlaceDAO.deleteUserPlaceSeqMapSeq(vo);
	}

}
