package com.cj.sroup.service;

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
	public List<M_noticeVO> getAllNotice() {
		// TODO Auto-generated method stub
		return m_noticedao.getAllNotice();
	}

	@Override
	public void delNotice(int n_no) {
		// TODO Auto-generated method stub
		System.out.println(n_no+ "값이다.");
		m_noticedao.delNotice(n_no);
	}

	
}
