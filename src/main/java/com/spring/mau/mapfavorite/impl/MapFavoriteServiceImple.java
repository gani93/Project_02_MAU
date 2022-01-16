package com.spring.mau.mapfavorite.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.map.MapVO;
import com.spring.mau.mapfavorite.MapFavoriteService;
import com.spring.mau.mapfavorite.MapFavoriteVO;
@Service("mapFavoriteService")
public class MapFavoriteServiceImple implements MapFavoriteService {
	@Autowired
	private MapFavoriteDAO mapFavoriteDAO;
	@Override
	public void insertFavorite(MapFavoriteVO vo) {
		// TODO Auto-generated method stub
		mapFavoriteDAO.insertFavorite(vo);
	}

	@Override
	public void deleteFavorite(MapFavoriteVO vo) {
		// TODO Auto-generated method stub
		mapFavoriteDAO.deleteFavorite(vo);
	}

	@Override
	public MapFavoriteVO getMapFavorite(MapFavoriteVO vo) {
		// TODO Auto-generated method stub
		return mapFavoriteDAO.getMapFavorite(vo);
	}

	@Override
	public MapVO getFavoriteUserSeqId(MapFavoriteVO vo) {
		// TODO Auto-generated method stub
		return mapFavoriteDAO.getFavoriteUserSeqId(vo);
	}

	@Override
	public MapFavoriteVO getFavoriteMapSeq(MapFavoriteVO vo) {
		// TODO Auto-generated method stub
		return mapFavoriteDAO.getFavoriteMapSeq(vo);
	}

	@Override
	public void deleteFavoriteNoUserSeqId(MapFavoriteVO vo) {
		// TODO Auto-generated method stub
		mapFavoriteDAO.deleteFavoriteNoUserSeqId(vo);
	}

}
