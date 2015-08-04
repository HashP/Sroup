package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.M_galleryVO;

public interface M_galleryDao {
	void addGallery(List<M_galleryVO> m_gallerys);		
	List<M_galleryVO> getAllGallery();
}
