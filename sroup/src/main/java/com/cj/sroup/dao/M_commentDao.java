package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.M_commentVO;

public interface M_commentDao {
	void addComment(M_commentVO m_comment);
	List<M_commentVO> getAllComment();
}
