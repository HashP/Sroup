package com.cj.sroup.dao;

import java.util.HashMap;
import java.util.List;

import com.cj.sroup.vo.M_boardReplyVO;
import com.cj.sroup.vo.M_boardVO;

public interface M_boardDao {
	void addBoard(M_boardVO m_board);		
	M_boardVO getBoardDetail(int b_no);
	int getAllBoardNo(int study_no);
	List<M_boardVO> getBoard_list(HashMap<String, Integer> num);
	List<M_boardVO> getSearchBoard_list(HashMap<String, Object> searchOption);	
	void delBoard(int b_no);
	void reBoard(M_boardVO m_board);
	void board_hitPlus(int b_no);
	// 덧글 부분
	List<M_boardReplyVO> getBoardReply(int b_no);
	void addBoardReply(M_boardReplyVO b_reply);
	void reBoardReply(M_boardReplyVO b_reply);
	void delBoardReply(int re_no);
	int nowAdd_no(String b_writer);
}
