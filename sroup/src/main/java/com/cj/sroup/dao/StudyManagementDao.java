package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.StudyManagementVO;

public interface StudyManagementDao {

	public List<StudyManagementVO> getCreateStudiesById(String id);
	public List<StudyManagementVO> getAttendStudiesById(String id);
	public List<StudyManagementVO> getFinishedCreateStudiesById(String id);
	public List<StudyManagementVO> getFinishedAttendStudiesById(String id);
	
	public void addNewMember(StudyManagementVO newMember);
	
	public List<String> getStudyMember(int studyNo);
}
