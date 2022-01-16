package com.spring.mau.place.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDAO placeDAO;
	@Override
	public void insertPlace(PlaceVO vo) {
		// TODO Auto-generated method stub
		placeDAO.insertPlace(vo);
	}
	@Override
	public PlaceVO getPlace(PlaceVO vo) {
		// TODO Auto-generated method stub
		return placeDAO.getPlace(vo);
	}
	@Override
	public PlaceVO getPlaceSeq(PlaceVO vo) {
		// TODO Auto-generated method stub
		return placeDAO.getPlaceSeq(vo);
	}
	@Override
	public PlaceVO getPlaceId(PlaceVO vo) {
		// TODO Auto-generated method stub
		return placeDAO.getPlaceId(vo);
	}
	@Override
	public List<PlaceVO> getPlacebyId(PlaceVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return placeDAO.getPlacebyId(vo);
	}
	
	@Override
	public List<PlaceVO> getPlaceList(PlaceVO vo) {
		// TODO Auto-generated method stub
		return placeDAO.getPlaceList(vo);
	}

}
