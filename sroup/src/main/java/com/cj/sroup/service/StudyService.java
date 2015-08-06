package com.cj.sroup.service;

import java.util.List;

import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.StudyVO;

public interface StudyService {
	
	public List<ListVO> getAllStudies();
	public void addStudy(StudyVO study);
}
