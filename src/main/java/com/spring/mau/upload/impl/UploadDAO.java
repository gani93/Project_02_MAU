package com.spring.mau.upload.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.upload.UploadVO;
@Repository
public class UploadDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPhoto(UploadVO uvo) {
		System.err.println("insertphoto 실행");
		mybatis.insert("UploadDAO.insertPhoto", uvo);
	}

	public List<UploadVO> getPhoto(UploadVO uvo) {
		System.err.println("getphoto 실행");
		return mybatis.selectList("UploadDAO.getPhoto", uvo);
	}
}
