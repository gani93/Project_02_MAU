package com.spring.mau.userplace.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.user.UserVO;
import com.spring.mau.userplace.UserPlaceVO;

@Repository
public class UserPlaceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUserPlace(UserPlaceVO vo) {
		System.out.println("UserPlaceDAO==>insertUserPlace 실행");
		mybatis.insert("UserPlaceDAO.insertUserPlace", vo);
	}
	
	public UserPlaceVO getUserPlaceMapSeq(UserPlaceVO vo) {
		System.out.println("UserPlaceDAO==>getUserPlaceMapSeq 실행");
		return mybatis.selectOne("UserPlaceDAO.getUserPlaceMapSeq", vo);
	}
	public void deleteUserPlace(UserPlaceVO vo) {
		System.out.println("UserPlaceDAO==>deleteUserPlace 실행");
		mybatis.delete("UserPlaceDAO.deleteUserPlace", vo);
	}
	public void deleteUserPlaceSeqMapSeq(UserPlaceVO vo) {
		System.out.println("deleteUserPlaceSeqMapSeq실행");
		mybatis.delete("UserPlaceDAO.deleteUserPlaceSeqMapSeq",vo);
	}
}
