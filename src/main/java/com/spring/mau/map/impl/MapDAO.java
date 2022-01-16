package com.spring.mau.map.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.map.MapVO;

@Repository
public class MapDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMap(MapVO vo) {
		System.out.println("가이더맵(개인테마) 생성");
		mybatis.insert("MapDAO.insertMap",vo);
	}
	public void insertGuideMap(MapVO vo) {
		System.out.println("가이드맵(테마) 생성");
		mybatis.insert("MapDAO.insertGuideMap",vo);
	}
	public List<MapVO> getMapList(MapVO vo) {
		System.out.println("모든타입의맵 가져오기");
		return mybatis.selectList("MapDAO.getMapList", vo);
	}
	public List<MapVO> getguideMapList(MapVO vo) {
		System.out.println("가이드맵(테마지도) 가져오기");
		return mybatis.selectList("MapDAO.getguideMapList", vo);
	}
	public List<MapVO> getguiderMapList(MapVO vo) {
		System.out.println("가이더맵(개인테마지도) 가져오기");
		return mybatis.selectList("MapDAO.getguiderMapList", vo);
	}
	public MapVO getMap(MapVO vo) {
		System.out.println("맵시퀀스로 맵 가져오기");
		return mybatis.selectOne("MapDAO.getMap", vo);
	}
	public List<MapVO> getguiderMapListAll() {
		System.out.println("가이더맵(공유가능) 가져오기");
		return mybatis.selectList("MapDAO.getguiderMapListAll");
	}
	public List<MapVO> getguideMapListAll() {
		System.out.println("가이드맵(공유가능) 가져오기");
		return mybatis.selectList("MapDAO.getguideMapListAll");
	}
	
	public void deleteMap(MapVO vo) {
		System.out.println("맵지우기");
		mybatis.delete("MapDAO.deleteMap",vo);
	}
	
	public void updateMap(MapVO vo) {
		System.out.println("맵수정하기");
		mybatis.update("MapDAO.updateMap",vo);
	}
	public List<MapVO> searchMap(MapVO vo) {
		System.out.println("맵검색");
		return mybatis.selectList("MapDAO.searchMap", vo);
	}
	
	public List<MapVO> searchMapCategory(MapVO vo) {
		System.out.println("맵카테고리검색");
		return mybatis.selectList("MapDAO.searchMapCategory", vo);
	}
	public Integer getPlaceCnt(MapVO vo) {
		System.out.println("맵시퀀스로 맵 가져오기");
		return mybatis.selectOne("MapDAO.getPlaceCnt", vo);
	}
	public List<MapVO> getMapSeq(MapVO vo) {
		System.out.println("시퀀스 가져오기");
		return mybatis.selectList("MapDAO.getMapSeq", vo);
	}
	public MapVO getfvcnt(MapVO vo) {
		System.out.println("즐찾 맵개수 가져오기");
		return mybatis.selectOne("MapDAO.getfvcnt",vo);
	}
	public MapVO getplcnt(MapVO vo) {
		System.out.println("즐찾 장소개수 가져오기");
		return mybatis.selectOne("MapDAO.getplcnt",vo);
	}
}
