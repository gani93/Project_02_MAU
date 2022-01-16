package com.spring.mau.upload;

import java.util.List;

public interface UploadService {
	void insertPhoto(UploadVO uvo);
	List<UploadVO> getPhoto(UploadVO uvo);
}
