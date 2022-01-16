package com.spring.mau.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertUser(UserVO vo) {
		System.out.println("인서트 얍");
		mybatis.insert("UserDAO.insertUser", vo);
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("겟유저 얍");
		return (UserVO)mybatis.selectOne("UserDAO.getUser",vo);
		
	}

	public void updateUser(UserVO vo) {
		System.out.println("업데이트 실행");
		mybatis.update("UserDAO.updateUser",vo);
	}
	

	public UserVO getDetail(UserVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return (UserVO)mybatis.selectOne("UserDAO.getDetail",vo);
	}
	public UserVO mypageGetUser(UserVO vo) {
		System.out.println("마이페이지 유저 정보");
		return (UserVO)mybatis.selectOne("UserDAO.mypageGetUser",vo);
	}
}
