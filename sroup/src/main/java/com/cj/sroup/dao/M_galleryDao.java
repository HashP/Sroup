package com.cj.sroup.dao;

import java.util.HashMap;
import java.util.List;

import com.cj.sroup.vo.M_galleryVO;

public interface M_galleryDao {
	void addGallery(M_galleryVO m_gallery);		
	List<M_galleryVO> getAllGallery();
	M_galleryVO detail_Gallery(int g_no);
	HashMap<String, Integer> getPrevNext(int g_no);
}
