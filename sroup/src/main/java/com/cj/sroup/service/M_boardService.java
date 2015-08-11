package com.cj.sroup.service;

import java.util.List;

import com.cj.sroup.vo.M_boardReplyVO;
import com.cj.sroup.vo.M_boardVO;

public interface M_boardService {
	void addBoard(M_boardVO m_board);
	M_boardVO getBoardDetail(int b_no);
	List<M_boardVO> getAllBoard();	
	void delBoard(int b_no);
	void reBoard(M_boardVO m_board);
	int nowAdd_no(String b_writer);
	// 덧글 부분
	List<M_boardReplyVO> getBoardReply(int b_no);
	void addBoardReply(M_boardReplyVO b_reply);
	void delBoardReply(int re_no);
}
