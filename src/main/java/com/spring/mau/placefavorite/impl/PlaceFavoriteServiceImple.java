package com.spring.mau.placefavorite.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.placefavorite.PlaceFavoriteVO;
import com.spring.mau.placefavorite.PlaceFavoriteService;
@Service("placeFavoriteService")
public class PlaceFavoriteServiceImple implements PlaceFavoriteService{
	@Autowired
	private PlaceFavoriteDAO placeFavoriteDAO;
	@Override
	public void insertPlaceFavorite(PlaceFavoriteVO fvo) {
		placeFavoriteDAO.insertPlaceFavorite(fvo);
	}
	@Override
	public void deletePlaceFavorite(PlaceFavoriteVO fvo) {
		placeFavoriteDAO.deletePlaceFavorite(fvo);
	}
	@Override
	public PlaceFavoriteVO getPlaceFavorite(PlaceFavoriteVO fvo) {
		return placeFavoriteDAO.getPlaceFavorite(fvo);
	}

}
