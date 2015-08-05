package com.cj.sroup.service;

import java.util.List;

import com.cj.sroup.vo.M_commentVO;


public interface M_commentService {
	void addComment(M_commentVO m_comment);
	List<M_commentVO> getAllComment();
}
