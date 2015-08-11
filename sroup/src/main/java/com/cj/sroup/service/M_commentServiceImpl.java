package com.cj.sroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_commentDao;
import com.cj.sroup.vo.M_commentVO;
@Service
@Transactional
public class M_commentServiceImpl implements M_commentService{
	@Autowired
	M_commentDao m_commentdao;
	
	@Override
	public void addComment(M_commentVO m_comment) {
		m_commentdao.addComment(m_comment);		
	}

	@Override
	public List<M_commentVO> getAllComment() {		
		return m_commentdao.getAllComment();
	}

	@Override
	public void delComment(int c_no) {		
		m_commentdao.delComment(c_no);
		
	}
	

}
