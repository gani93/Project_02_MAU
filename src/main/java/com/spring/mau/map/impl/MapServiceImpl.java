package com.spring.mau.map.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;

@Service("mapService")
public class MapServiceImpl implements MapService {
	@Autowired
	private MapDAO mapDao;
	@Override
	public void insertMap(MapVO vo) {
		// TODO Auto-generated method stub
		mapDao.insertMap(vo);
	}
	public void insertGuideMap(MapVO vo) {
		// TODO Auto-generated method stub
		mapDao.insertGuideMap(vo);
	}
	@Override
	public List<MapVO> getMapList(MapVO vo) {
		// TODO Auto-generated method stub
		return mapDao.getMapList(vo);
	}
	@Override
	public List<MapVO> getguideMapList(MapVO vo) {
		// TODO Auto-generated method stub
		return mapDao.getguideMapList(vo);
	}
	@Override
	public List<MapVO> getguiderMapList(MapVO vo) {
		// TODO Auto-generated method stub
		return mapDao.getguiderMapList(vo);
	}
	@Override
	public MapVO getMap(MapVO vo) {
		// TODO Auto-generated method stub
		return mapDao.getMap(vo);
	}
	@Override
	public List<MapVO> getguiderMapListAll() {
		// TODO Auto-generated method stub
		return mapDao.getguiderMapListAll();
	}
	@Override
	public List<MapVO> getguideMapListAll() {
		// TODO Auto-generated method stub
		return mapDao.getguideMapListAll();
	}
	@Override
	public void deleteMap(MapVO vo) {
		// TODO Auto-generated method stub
		mapDao.deleteMap(vo);
	}
	@Override
	public void updateMap(MapVO vo) {
		// TODO Auto-generated method stub
		mapDao.updateMap(vo);
	}
	@Override
	public List<MapVO> searchMap(MapVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapDao.searchMap(vo);
	}
	@Override
	public List<MapVO> searchMapCategory(MapVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapDao.searchMapCategory(vo);
	}
	@Override
	public Integer getPlaceCnt(MapVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapDao.getPlaceCnt(vo);
	}
	
	@Override
	public List<MapVO> getMapSeq(MapVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapDao.getMapSeq(vo);
	}
	@Override
	public MapVO getfvcnt(MapVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapDao.getfvcnt(vo);
	}
	@Override
	public MapVO getplcnt(MapVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapDao.getplcnt(vo);
	}

}
