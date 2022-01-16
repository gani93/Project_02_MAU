package com.spring.mau.review;

import java.util.List;

public interface ReviewService {
	void insertReview(ReviewVO vo);

	List<ReviewVO> getReview(ReviewVO vo);
	
	void deleteReview(ReviewVO vo);
	
}
