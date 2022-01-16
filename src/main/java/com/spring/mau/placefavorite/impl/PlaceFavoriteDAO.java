package com.spring.mau.placefavorite.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.map.MapVO;
import com.spring.mau.mapfavorite.MapFavoriteVO;
import com.spring.mau.placefavorite.PlaceFavoriteVO;

@Repository
public class PlaceFavoriteDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertPlaceFavorite(PlaceFavoriteVO fvo) {
		// TODO Auto-generated method stub
		System.out.println("PlaceFavoriteDAO==>insertPlaceFavorite 실행");
		mybatis.insert("PlaceFavoriteDAO.insertPlaceFavorite", fvo);
	}
	
	public void deletePlaceFavorite(PlaceFavoriteVO fvo) {
		// TODO Auto-generated method stub
		System.out.println("PlaceFavoriteDAO==>deletePlaceFavorite 실행");
		mybatis.delete("PlaceFavoriteDAO.deletePlaceFavorite", fvo);
	}
	
	public PlaceFavoriteVO getPlaceFavorite(PlaceFavoriteVO fvo) {
		System.out.println("PlaceFavoriteDAO==>getPlaceFavorite 실행");
		return mybatis.selectOne("PlaceFavoriteDAO.getPlaceFavorite", fvo);
	}
//	public MapVO getFavoriteUserSeqId(MapFavoriteVO vo) {
//		System.out.println("MapFavoriteDAO==>getFavoriteUserSeqId 실행");
//		return mybatis.selectOne("MapFavoriteDAO.getFavoriteUserSeqId", vo);
//	}
}
