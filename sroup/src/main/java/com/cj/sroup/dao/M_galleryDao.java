package com.cj.sroup.dao;

import java.util.HashMap;
import java.util.List;


import com.cj.sroup.vo.M_galleryVO;

public interface M_galleryDao {
	void addGallery(M_galleryVO m_gallery);	
	int getAllGalleryNo();
	List<M_galleryVO> getGallery_list(HashMap<String, Integer> num);
	M_galleryVO detail_Gallery(int g_no);
	void delGallery(int g_no);
	void reGallery(M_galleryVO m_board);
	HashMap<String, Integer> getPrevNext(int g_no);
}
