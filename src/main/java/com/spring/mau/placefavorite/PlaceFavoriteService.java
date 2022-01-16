package com.spring.mau.placefavorite;

public interface PlaceFavoriteService {
	void insertPlaceFavorite(PlaceFavoriteVO fvo);
	void deletePlaceFavorite(PlaceFavoriteVO fvo);
	PlaceFavoriteVO getPlaceFavorite(PlaceFavoriteVO fvo);
//	PlaceFavoriteVO getPlaceFavoriteUserSeqId(PlaceFavoriteVO fvo);
}
