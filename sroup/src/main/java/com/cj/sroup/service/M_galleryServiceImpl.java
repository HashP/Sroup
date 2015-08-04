package com.cj.sroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_galleryDao;
import com.cj.sroup.vo.M_galleryVO;

@Service
@Transactional
public class M_galleryServiceImpl implements M_galleryService{

	@Autowired
	private M_galleryDao m_gallerydao;
	
	@Override
	public void addGallery(List<M_galleryVO> m_gallerys) {
		// TODO Auto-generated method stub
		m_gallerydao.addGallery(m_gallerys);
		
	}

	@Override
	public List<M_galleryVO> getAllGallery() {
		// TODO Auto-generated method stub		
		return m_gallerydao.getAllGallery();
	}	
}
