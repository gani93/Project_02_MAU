package com.spring.mau.mapplace.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.mapplace.MapPlaceVO;

@Repository
public class MapPlaceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMapPlace(MapPlaceVO vo) {
		System.out.println("MapPlaceDAO==>insertMapPlace 실행");
		mybatis.insert("MapPlaceDAO.insertMapPlace", vo);
	}
	
	public void deleteMapPlace(MapPlaceVO vo) {
		System.out.println("MapPlaceDAO==>deleteMapPlace 실행");
		mybatis.delete("MapPlaceDAO.deleteMapPlace",vo);
	}
	public MapPlaceVO getMapPlaceSeq(MapPlaceVO vo) {
		System.out.println("MapPlaceDAO==>getMapSeq 실행");
		return mybatis.selectOne("MapPlaceDAO.getMapPlaceSeq",vo);
	}
	
	public void deleteMapPlaceSeq(MapPlaceVO vo) {
		System.out.println("MapPlaceDAO==>deleteMapPlaceSeq 실행");
		mybatis.delete("MapPlaceDAO.deleteMapPlaceSeq",vo);
	}
}
