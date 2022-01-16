package com.spring.mau.map;

import java.util.List;

public interface MapService {
	void insertMap(MapVO vo);
	void insertGuideMap(MapVO vo);
	MapVO getMap(MapVO vo);
	List<MapVO> getMapList(MapVO vo);
	List<MapVO> getguideMapList(MapVO vo);
	List<MapVO> getguiderMapList(MapVO vo);
	List<MapVO> getguiderMapListAll();
	List<MapVO> getguideMapListAll();
	void deleteMap(MapVO vo);
	void updateMap(MapVO vo);
	List<MapVO> searchMap(MapVO vo);
	List<MapVO> searchMapCategory(MapVO vo);
	Integer getPlaceCnt(MapVO vo);
	List<MapVO> getMapSeq(MapVO vo);
	MapVO getfvcnt(MapVO vo);
	MapVO getplcnt(MapVO vo);
}
