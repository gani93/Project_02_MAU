package com.spring.mau.userplace;

public interface UserPlaceService {
	void insertUserPlace(UserPlaceVO vo);
	void deleteUserPlace(UserPlaceVO vo);
	UserPlaceVO getUserPlaceMapSeq(UserPlaceVO vo);
	void deleteUserPlaceSeqMapSeq(UserPlaceVO vo);
}
