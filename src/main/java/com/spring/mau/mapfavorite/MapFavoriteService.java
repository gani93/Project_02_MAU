package com.spring.mau.mapfavorite;

import java.util.List;

import com.spring.mau.map.MapVO;

public interface MapFavoriteService {
	void insertFavorite(MapFavoriteVO vo);
	void deleteFavorite(MapFavoriteVO vo);
	void deleteFavoriteNoUserSeqId(MapFavoriteVO vo);
	MapFavoriteVO getMapFavorite(MapFavoriteVO vo);
	MapVO getFavoriteUserSeqId(MapFavoriteVO vo);
	MapFavoriteVO getFavoriteMapSeq(MapFavoriteVO vo);
}
