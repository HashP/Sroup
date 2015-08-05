package com.cj.sroup.service;

import java.util.List;
import com.cj.sroup.vo.M_boardVO;

public interface M_boardService {
	void addBoard(M_boardVO m_board);
	List<M_boardVO> getAllBoard();	
}
