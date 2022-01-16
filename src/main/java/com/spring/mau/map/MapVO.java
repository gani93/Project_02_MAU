package com.spring.mau.map;

public class MapVO {
	private String mapName,mapIcon,keyWord,kateGory,search,searchKategory;
	private int mapSeq,userSeqId,shareYn,mapType,mapCnt,fvCnt,plCnt;
	private Integer placeCnt;

	

	public int getPlCnt() {
		return plCnt;
	}
	public void setPlCnt(int plCnt) {
		this.plCnt = plCnt;
	}
	public int getFvCnt() {
		return fvCnt;
	}
	public void setFvCnt(int fvCnt) {
		this.fvCnt = fvCnt;
	}
	public Integer getPlaceCnt() {
		return placeCnt;
	}
	public void setPlaceCnt(Integer placeCnt) {
		this.placeCnt = placeCnt;
	}
	public String getSearchKategory() {
		return searchKategory;
	}
	public void setSearchKategory(String searchKategory) {
		this.searchKategory = searchKategory;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getMapName() {
		return mapName;
	}
	public void setMapName(String mapName) {
		this.mapName = mapName;
	}
	public String getMapIcon() {
		return mapIcon;
	}
	public void setMapIcon(String mapIcon) {
		this.mapIcon = mapIcon;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getKateGory() {
		return kateGory;
	}
	public void setKateGory(String kateGory) {
		this.kateGory = kateGory;
	}
	public int getMapSeq() {
		return mapSeq;
	}
	public void setMapSeq(int mapSeq) {
		this.mapSeq = mapSeq;
	}
	public int getUserSeqId() {
		return userSeqId;
	}
	public void setUserSeqId(int userSeqId) {
		this.userSeqId = userSeqId;
	}
	public int getShareYn() {
		return shareYn;
	}
	public void setShareYn(int shareYn) {
		this.shareYn = shareYn;
	}
	public int getMapType() {
		return mapType;
	}
	public void setMapType(int mapType) {
		this.mapType = mapType;
	}
	public int getMapCnt() {
		return mapCnt;
	}
	public void setMapCnt(int mapCnt) {
		this.mapCnt = mapCnt;
	}
	
}
