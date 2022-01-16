package com.spring.mau.mapplace;

import com.spring.mau.map.MapVO;

public interface MapPlaceService {
	void insertMapPlace(MapPlaceVO vo);
	void deleteMapPlace(MapPlaceVO vo);
	MapPlaceVO getMapPlaceSeq(MapPlaceVO vo);
	void deleteMapPlaceSeq(MapPlaceVO vo);
}
