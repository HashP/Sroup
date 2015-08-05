package com.cj.sroup.dao;

import java.util.List;
import com.cj.sroup.vo.M_boardVO;


public interface M_boardDao {
	void addBoard(M_boardVO m_board);		
	List<M_boardVO> getAllBoard();
}
