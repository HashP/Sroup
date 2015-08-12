package com.cj.sroup.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cj.sroup.dao.M_boardDao;
import com.cj.sroup.vo.M_boardReplyVO;
import com.cj.sroup.vo.M_boardVO;


@Service
@Transactional
public class M_boardServiceImpl implements M_boardService{
	
	@Autowired
	M_boardDao m_boarddao;
	
	

	public M_boardVO getBoardDetail(int b_no) {
		m_boarddao.board_hitPlus(b_no);	
		return m_boarddao.getBoardDetail(b_no);
		
	}
	
	public void addBoard(M_boardVO m_board){
		m_boarddao.addBoard(m_board);
	}

	@Override
	public void delBoard(int b_no) {
		// TODO Auto-generated method stub
		m_boarddao.delBoard(b_no);
	}

	@Override
	public List<M_boardReplyVO> getBoardReply(int b_no) {		
		return m_boarddao.getBoardReply(b_no);
	}

	public void addBoardReply(M_boardReplyVO b_reply){
		System.out.println(b_reply.getRe_content()+"!!!");
		m_boarddao.addBoardReply(b_reply);
	}

	@Override
	public void delBoardReply(int re_no) {
		m_boarddao.delBoardReply(re_no);
		
	}

	@Override
	public void reBoard(M_boardVO m_board) {
		m_boarddao.reBoard(m_board);
		
	}

	@Override
	public int nowAdd_no(String b_writer) {
		return m_boarddao.nowAdd_no(b_writer);
	}

	@Override
	public int getAllBoardNo() {		
		return m_boarddao.getAllBoardNo();
	}

	@Override
	public List<M_boardVO> getBoard_list(HashMap<String, Integer> num) {		
		return m_boarddao.getBoard_list(num);				
	}	
	
	
}
