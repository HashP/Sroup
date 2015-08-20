package com.cj.sroup.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cj.sroup.vo.M_galleryVO;

public interface M_galleryService {
	void addGallery(M_galleryVO m_gallery);	
	int getAllGalleryNo(int study_no);
	List<M_galleryVO> getGallery_list(HashMap<String, Integer> num);
	M_galleryVO detail_Gallery(int g_no);
	String m_albumImageUpload(MultipartFile photofile);
	void delGallery(int g_no);
	void reGallery(M_galleryVO m_gallery);
	HashMap<String, Integer> getPrevNext(M_galleryVO m_gallery);
}
