package com.spring.mau.upload.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.upload.UploadVO;
import com.spring.mau.upload.UploadService;

@Service("UploadService")
public class UploadServceImpl implements UploadService{

	@Autowired
	private UploadDAO uploadDAO;
	@Override
	public void insertPhoto(UploadVO uvo) {
		uploadDAO.insertPhoto(uvo);
	}
	@Override
	public List<UploadVO> getPhoto(UploadVO uvo) {
		return uploadDAO.getPhoto(uvo);
	}
}
