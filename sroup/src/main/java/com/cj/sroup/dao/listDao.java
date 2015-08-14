package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.CategoryVO;
import com.cj.sroup.vo.CheckVO;
import com.cj.sroup.vo.JoinVO;
import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.StudyManagementVO;
import com.cj.sroup.vo.StudyVO;

public interface listDao {

	public List<ListVO> getAllStudies();
	public void addStudy(StudyVO study);
	public void addCheck(CheckVO check);
	public CheckVO userCheck(String user_id);
	public void modifyCheck(CheckVO check);
	public StudyVO pAddrCheck(String p_address);
	public String getSubject(String sub_value);
	public List<CategoryVO> getCategories();
	public int getStudyNo();
	public void addJoin(JoinVO join);
	public void addStudyManagement(StudyManagementVO studyManagement);
	public List<CategoryVO> getArea();
	public StudyVO getStudyInfoByNo(int study_no);
	public StudyVO getAvailable(int study_no);
}
