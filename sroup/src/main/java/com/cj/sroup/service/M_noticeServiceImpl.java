package com.cj.sroup.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_noticeDao;
import com.cj.sroup.vo.M_noticeVO;

@Service
@Transactional
public class M_noticeServiceImpl implements M_noticeService {
	@Autowired
	M_noticeDao m_noticedao;
	
	@Override
	public void addNotice(M_noticeVO m_notice) {
		// TODO Auto-generated method stub		
		m_noticedao.addNotice(m_notice);
		
	}

	@Override
	public List<M_noticeVO> getAllNotice(int study_no) {
		// TODO Auto-generated method stub
		return m_noticedao.getAllNotice(study_no);
	}

	@Override
	public void delNotice(int n_no) {
		// TODO Auto-generated method stub
		System.out.println(n_no+ "값이다.");
		m_noticedao.delNotice(n_no);
	}

	@Override
	public void reNotice(M_noticeVO m_notice) {
		m_noticedao.reNotice(m_notice);		
	}

	@Override
	public M_noticeVO reNoticeInfo(int n_no) {
		return m_noticedao.reNoticeInfo(n_no);		
	}

	@Override
	public List<M_noticeVO> getMuhanNotice(HashMap<String, String> map) {
		return m_noticedao.getMuhanNotice(map);
		
	}
	
	

	
}
