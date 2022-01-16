package com.spring.mau.place.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.place.PlaceVO;

@Repository
public class PlaceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPlace(PlaceVO vo) {
		System.out.println("PlaceDAO==>insertPlace 실행");
		mybatis.insert("PlaceDAO.insertPlace", vo);
	}
	public PlaceVO getPlace(PlaceVO vo) {
		System.out.println("getPlace 실행");
		return mybatis.selectOne("PlaceDAO.getPlace", vo); 
	}
	
	public PlaceVO getPlaceSeq(PlaceVO vo) {
		System.out.println("PlaceDAO==>getPlaceSeq 실행");
		return (PlaceVO)mybatis.selectOne("PlaceDAO.getPlaceSeq",vo);
	}
	
	public PlaceVO getPlaceId(PlaceVO vo) {
		System.out.println("PlaceDAO==>getPlaceId 실행");
		return (PlaceVO)mybatis.selectOne("PlaceDAO.getPlaceId",vo);
	}
	
	public List<PlaceVO> getPlacebyId(PlaceVO vo) {
		System.out.println("PlaceDAO==>getPlacebyId 실행");
		return mybatis.selectList("PlaceDAO.getPlacebyId",vo);
	}
	
	public List<PlaceVO> getPlaceList(PlaceVO vo) {
		System.out.println("getPlaceList 실행");
		return mybatis.selectList("PlaceDAO.getPlaceList",vo); 
	}
}
