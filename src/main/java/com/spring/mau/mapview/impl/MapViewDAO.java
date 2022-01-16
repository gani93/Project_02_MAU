package com.spring.mau.mapview.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.mapview.MapViewVO;

@Repository
public class MapViewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MapViewVO> getMap(MapViewVO vo) {
		System.out.println("MapViewDAO==>getMap 실행");
		return mybatis.selectList("MapViewDAO.getMapView",vo);
	}
	public List<MapViewVO> getMapSeq(MapViewVO vo) {
		System.out.println("MapViewDAO==>getMapSeq 실행");
		return mybatis.selectList("MapViewDAO.getMapSeq",vo);
	}
	
	public List<MapViewVO> getRandomMap(MapViewVO vo) {
		System.out.println("MapViewDAO==>getRandomMap 실행");
		return mybatis.selectList("MapViewDAO.getRandomMap",vo);
	}
	
	public List<MapViewVO> getGuiderPlace(MapViewVO vo) {
		System.out.println("MapViewDAO==>getGuiderPlace 실행");
		return mybatis.selectList("MapViewDAO.getGuiderPlace",vo);
	}
	
	public MapViewVO getBySeq(MapViewVO vo) {
		System.out.println("MapViewDAO==>getBySeq 실행");
		return mybatis.selectOne("MapViewDAO.getBySeq",vo);
	}
	
	public MapViewVO getBySeq2(MapViewVO vo) {
		System.out.println("MapViewDAO==>getBySeq2 실행");
		return mybatis.selectOne("MapViewDAO.getBySeq2",vo);
	}
	
	public MapViewVO getPlaceCnt(MapViewVO vo) {
		System.out.println("MapViewDAO==>getPlaceCnt 실행");
		return mybatis.selectOne("MapViewDAO.getPlaceCnt",vo);
	}
	public List<MapViewVO> getNewestMap(MapViewVO vo) {
		System.out.println("MapViewDAO==>getRandomMap 실행");
		return mybatis.selectList("MapViewDAO.getNewestMap",vo);
	}
	
	public List<MapViewVO> getHotUser(MapViewVO vo) {
		System.out.println("MapViewDAO==>getRandomMap 실행");
		return mybatis.selectList("MapViewDAO.getHotUser",vo);
	}
	
	public List<MapViewVO> favoriteMap(MapViewVO vo) {
		System.out.println("MapViewDAO==>getRandomMap 실행");
		return mybatis.selectList("MapViewDAO.favoriteMap",vo);
	}
	
	public List<MapViewVO> favoritePlace(MapViewVO vo) {
		System.out.println("MapViewDAO==>getRandomMap 실행");
		return mybatis.selectList("MapViewDAO.favoritePlace",vo);
	}
	public List<MapViewVO> favoriteGuide(MapViewVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mybatis.selectList("MapViewDAO.favoriteGuide",vo);
	}
	public List<MapViewVO> getRandomGuide(MapViewVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mybatis.selectList("MapViewDAO.getRandomGuide",vo);
	}
	public List<MapViewVO> getkeyword(MapViewVO mvo) {
		System.out.println("MapViewDAO==>getkeyword 실행");
		return mybatis.selectList("MapViewDAO.getkeyword",mvo);
	}
	
	public MapViewVO getPlace2(MapViewVO mvo) {
		System.out.println("MapViewDAO==>getPlace2 실행");
		return mybatis.selectOne("MapViewDAO.getPlace2",mvo);
	}
	
}
