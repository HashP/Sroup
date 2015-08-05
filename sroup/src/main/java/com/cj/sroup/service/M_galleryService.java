package com.cj.sroup.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cj.sroup.vo.M_galleryVO;

public interface M_galleryService {
	void addGallery(M_galleryVO m_gallery);
	List<M_galleryVO> getAllGallery();
	String m_albumImageUpload(MultipartFile photofile);
}
