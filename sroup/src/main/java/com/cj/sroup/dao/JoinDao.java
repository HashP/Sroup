package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.JoinVO;

public interface JoinDao {

	public List<JoinVO> getApplicantsByStudyNo(int studyNo); 
}
