package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.M_galleryVO;

public interface M_galleryDao {
	void addGallery(M_galleryVO m_gallery);		
	List<M_galleryVO> getAllGallery();
}
