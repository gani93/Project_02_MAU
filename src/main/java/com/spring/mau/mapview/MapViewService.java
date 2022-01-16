package com.spring.mau.mapview;

import java.util.List;

public interface MapViewService {
	List<MapViewVO> getMap(MapViewVO vo);
	List<MapViewVO> getGuiderPlace(MapViewVO vo);
	List<MapViewVO> getMapSeq(MapViewVO vo);
	List<MapViewVO> getRandomMap(MapViewVO vo);
	MapViewVO getBySeq(MapViewVO vo);
	MapViewVO getBySeq2(MapViewVO vo);
	MapViewVO getPlaceCnt(MapViewVO vo);
	List<MapViewVO> getNewestMap(MapViewVO vo);
	List<MapViewVO> getHotUser(MapViewVO vo);
	List<MapViewVO> favoriteMap(MapViewVO vo);
	List<MapViewVO> favoritePlace(MapViewVO vo);
	List<MapViewVO> favoriteGuide(MapViewVO vo);
	List<MapViewVO> getRandomGuide(MapViewVO vo);
	List<MapViewVO> getkeyword(MapViewVO mvo);
	MapViewVO getPlace2(MapViewVO mvo);

}
