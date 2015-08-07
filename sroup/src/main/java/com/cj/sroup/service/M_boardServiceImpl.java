package com.cj.sroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_boardDao;
import com.cj.sroup.vo.M_boardVO;


@Service
@Transactional
public class M_boardServiceImpl implements M_boardService{
	
	@Autowired
	M_boardDao m_boarddao;
	
	public List<M_boardVO> getAllBoard(){		
		return m_boarddao.getAllBoard();
	}	

	public void addBoard(M_boardVO m_board){
		m_boarddao.addBoard(m_board);
	}

	@Override
	public void delBoard(int b_no) {
		// TODO Auto-generated method stub
		m_boarddao.delBoard(b_no);
	}
	
	
	
}
