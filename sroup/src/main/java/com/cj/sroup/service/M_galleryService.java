package com.cj.sroup.service;

import java.util.List;

import com.cj.sroup.vo.M_galleryVO;

public interface M_galleryService {
	void addGallery(List<M_galleryVO> m_gallerys);
	List<M_galleryVO> getAllGallery();
}
