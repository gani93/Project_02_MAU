package com.spring.mau.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.review.ReviewService;
import com.spring.mau.review.ReviewVO;
@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public List<ReviewVO> getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);		
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);		
	}

}
