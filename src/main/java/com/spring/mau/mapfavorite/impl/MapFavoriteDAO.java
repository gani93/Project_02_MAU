package com.spring.mau.mapfavorite.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.map.MapVO;
import com.spring.mau.mapfavorite.MapFavoriteVO;
@Repository
public class MapFavoriteDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertFavorite(MapFavoriteVO vo) {
		System.out.println("MapFavoriteDAO==>insertFavorite 실행");
		mybatis.insert("MapFavoriteDAO.insertFavorite", vo);
	}
	public void deleteFavorite(MapFavoriteVO vo) {
		System.out.println("MapFavoriteDAO==>deleteFavorite 실행");
		mybatis.delete("MapFavoriteDAO.deleteFavorite", vo);
	}
	public MapFavoriteVO getMapFavorite(MapFavoriteVO vo) {
		System.out.println("MapFavoriteDAO==>getMapFavorite 실행");
		return mybatis.selectOne("MapFavoriteDAO.getFavorite", vo);
	}
	public MapVO getFavoriteUserSeqId(MapFavoriteVO vo) {
		System.out.println("MapFavoriteDAO==>getFavoriteUserSeqId 실행");
		return mybatis.selectOne("MapFavoriteDAO.getFavoriteUserSeqId", vo);
	}
	
	public MapFavoriteVO getFavoriteMapSeq(MapFavoriteVO vo) {
		System.out.println("MapFavoriteDAO==>getFavoriteMapSeq 실행");
		return mybatis.selectOne("MapFavoriteDAO.getFavoriteMapSeq", vo);
	}
	public void deleteFavoriteNoUserSeqId(MapFavoriteVO vo) {
		System.out.println("MapFavoriteDAO==>deleteFavoriteNoUserSeqId 실행");
		mybatis.delete("MapFavoriteDAO.deleteFavoriteNoUserSeqId", vo);
	}
}
