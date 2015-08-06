package com.cj.sroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.listDao;
import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.StudyVO;

@Service
@Transactional
public class StudyImpl implements StudyService {
	
	@Autowired
	private listDao listdao;
	
	public void addStudy(StudyVO study) {
		
	}
	
	public List<ListVO> getAllStudies() {
		List<ListVO> list = listdao.getAllStudies();
		return list;
	}
}
