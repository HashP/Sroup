package com.cj.sroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sun.print.resources.serviceui;

import com.cj.sroup.dao.listDao;
import com.cj.sroup.vo.CategoryVO;
import com.cj.sroup.vo.CheckVO;
import com.cj.sroup.vo.JoinVO;
import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.StudyManagementVO;
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
	public List<ListVO> getAllStudiesBySoon() {
		List<ListVO> list = listdao.getAllStudiesBySoon();
		return list;
	}
	@Override
	public List<ListVO> getAllStudiesByLatest() {
		List<ListVO> list = listdao.getAllStudiesByLatest();
		return list;
	}
	@Override
	public List<ListVO> getAllStudiesCat(List<String> cat) {
		List<ListVO> list = listdao.getAllStudiesCat(cat);
		return list;
	}
	@Override
	public List<ListVO> getAllStudiesByLatestCat(List<String> cat) {
		List<ListVO> list = listdao.getAllStudiesByLatestCat(cat);
		return list;
	}
	@Override
	public List<ListVO> getAllStudiesBySoonCat(List<String> cat) {
		List<ListVO> list = listdao.getAllStudiesBySoonCat(cat);
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
	public String getSubjectByNo(String sub_value) {
		String subject = listdao.getSubjectByNo(sub_value);
		return subject;
	}
	
	@Override
	public int getStudyNo() {
		int studyNo = listdao.getStudyNo();
		return studyNo;
	}
	
	@Override
	public void addJoin(JoinVO join) {
		listdao.addJoin(join);
		
	}
	
	@Override
	public void addStudyManagement(StudyManagementVO studyManagement) {
		listdao.addStudyManagement(studyManagement);
		
	}
	@Override
	public List<CategoryVO> getArea() {
		List<CategoryVO> area = listdao.getArea();
		return area;
	}
	
	@Override
	public StudyVO getStudyInfoByNo(int study_no) {
		StudyVO studyInfo = listdao.getStudyInfoByNo(study_no);
		return studyInfo;
	}
	@Override
	public StudyVO getAvailable(int study_no) {
		StudyVO available = listdao.getAvailable(study_no);
		return available;
	}
	
	@Override
	public StudyManagementVO getStudyManagementInfo(
			StudyManagementVO studyManage) {
		StudyManagementVO study = listdao.getStudyManagementInfo(studyManage);
		return study;
	}
	@Override
	public JoinVO getJoinInfo(JoinVO join) {
		JoinVO joinInfo = listdao.getJoinInfo(join);
		return joinInfo;
	}
	@Override
	public void deleteJoin(JoinVO join) {
		listdao.deleteJoin(join);
	}
	@Override
	public void studyHit(int study_no) {
		listdao.studyHit(study_no);
	}
	
}
