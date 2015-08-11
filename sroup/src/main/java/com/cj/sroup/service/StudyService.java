package com.cj.sroup.service;

import java.util.List;

import com.cj.sroup.vo.CheckVO;
import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.StudyVO;

public interface StudyService {
	
	public List<ListVO> getAllStudies();
	public void addStudy(StudyVO study);
	public void addCheck(CheckVO check);
	public CheckVO userCheck(String user_id);
	public void modifyCheck(CheckVO check);
}
