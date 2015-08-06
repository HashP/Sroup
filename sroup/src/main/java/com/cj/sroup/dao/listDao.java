package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.StudyVO;

public interface listDao {

	public List<ListVO> getAllStudies();
	public void addStudy(StudyVO study);
	
}
