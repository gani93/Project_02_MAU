package com.spring.mau.upload;

import org.springframework.web.multipart.MultipartFile;

public class UploadVO {
	MultipartFile photoUpload;
	private String photoName;
	private int photoSeq;
	@Override
	public String toString() {
		return "UploadVO [photoUpload=" + photoUpload + ", photoName=" + photoName + ", photoSeq=" + photoSeq
				+ ", placeSeq=" + placeSeq + "]";
	}
	private int placeSeq;
	public MultipartFile getPhotoUpload() {
		return photoUpload;
	}
	public void setPhotoUpload(MultipartFile photoUpload) {
		this.photoUpload = photoUpload;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public int getPhotoSeq() {
		return photoSeq;
	}
	public void setPhotoSeq(int photoSeq) {
		this.photoSeq = photoSeq;
	}
	public int getPlaceSeq() {
		return placeSeq;
	}
	public void setPlaceSeq(int placeSeq) {
		this.placeSeq = placeSeq;
	}
}
