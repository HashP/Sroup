package com.cj.sroup.service;

import java.util.HashMap;
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
	public List<M_commentVO> getAllComment(int study_no) {		
		return m_commentdao.getAllComment(study_no);
	}

	@Override
	public void delComment(int c_no) {		
		m_commentdao.delComment(c_no);
		
	}

	@Override
	public M_commentVO rewriteComment(M_commentVO m_comment) {
		m_commentdao.reComment(m_comment);
		return m_commentdao.reComment_get(m_comment.getC_no());
	}

	@Override
	public List<M_commentVO> getdateComment(HashMap<String, String> param) {		
		
		if(m_commentdao.getdateComment(param).isEmpty()==true){
			
			return null;
		}
		return m_commentdao.getdateComment(param);
	}
	

}
