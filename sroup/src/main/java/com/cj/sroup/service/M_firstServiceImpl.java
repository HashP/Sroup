package com.cj.sroup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_firstDao;
@Service
@Transactional
public class M_firstServiceImpl implements M_firstService {
	@Autowired
	private M_firstDao m_firstdao;
	
	@Override
	public int get_studyNo(String study_address) {		
		return m_firstdao.get_studyNo(study_address);
	}

}
