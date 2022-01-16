package com.spring.mau.place;

import java.util.List;

import com.spring.mau.mapview.MapViewVO;

public interface PlaceService {
	void insertPlace(PlaceVO vo);
	
	PlaceVO getPlace(PlaceVO vo);
	
	PlaceVO getPlaceSeq(PlaceVO vo);
	
	PlaceVO getPlaceId(PlaceVO vo);
	
	List<PlaceVO>getPlacebyId(PlaceVO vo);
	
	List<PlaceVO> getPlaceList(PlaceVO vo);
}
