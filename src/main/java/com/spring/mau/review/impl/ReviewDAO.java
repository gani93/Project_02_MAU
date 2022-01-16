package com.spring.mau.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.review.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertReview(ReviewVO vo) {
		System.out.println("insertReview 실행");
		mybatis.insert("ReviewDAO.insertReview", vo);
	}

	public List<ReviewVO> getReview(ReviewVO vo) {
		System.out.println("getReview 실행");
		return mybatis.selectList("ReviewDAO.getReview", vo);
	}

	public void deleteReview(ReviewVO vo) {
		System.out.println("deleteReview 실행");
		mybatis.delete("ReviewDAO.deleteReview", vo);
	}
}
