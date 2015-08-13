package com.cj.sroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.listDao;
import com.cj.sroup.vo.CategoryVO;
import com.cj.sroup.vo.CheckVO;
import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.StudyVO;

@Service
@Transactional
public class StudyImpl implements StudyService {
	
	@Autowired
	private listDao listdao;
	
	public void addStudy(StudyVO study) {
		listdao.addStudy(study);
	}
	public List<ListVO> getAllStudies() {
		List<ListVO> list = listdao.getAllStudies();
		return list;
	}
	
	@Override
	public void addCheck(CheckVO check) {
		listdao.addCheck(check);
	}
	@Override
	public CheckVO userCheck(String user_id) {
		CheckVO check = listdao.userCheck(user_id);
		return check;
	}
	
	@Override
	public void modifyCheck(CheckVO check) {
		listdao.modifyCheck(check);
	}
	@Override
	public StudyVO pAddrCheck(String p_address) {
		StudyVO pCheck = listdao.pAddrCheck(p_address);
		return pCheck;
	}
	@Override
	public List<CategoryVO> getCategories() {
		List<CategoryVO> categories = listdao.getCategories();
		return categories;
	}
	@Override
	public String getSubject(String sub_value) {
		String subject = listdao.getSubject(sub_value);
		return subject;
	}
	
	@Override
	public int getStudyNo() {
		int studyNo = listdao.getStudyNo();
		return studyNo;
	}
}
