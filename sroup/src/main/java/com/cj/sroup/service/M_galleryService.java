package com.cj.sroup.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cj.sroup.vo.M_galleryVO;

public interface M_galleryService {
	void addGallery(M_galleryVO m_gallery);	
	int getAllGalleryNo();
	List<M_galleryVO> getGallery_list(HashMap<String, Integer> num);
	M_galleryVO detail_Gallery(int g_no);
	String m_albumImageUpload(MultipartFile photofile);
	void delGallery(int g_no);
	void reGallery(M_galleryVO m_board);
	HashMap<String, Integer> getPrevNext(int g_no);
}
