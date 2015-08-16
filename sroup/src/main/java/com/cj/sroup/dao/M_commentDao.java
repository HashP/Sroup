package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.M_commentVO;

public interface M_commentDao {
	void addComment(M_commentVO m_comment);
	List<M_commentVO> getAllComment();
	List<M_commentVO> getdateComment(String selectDate);
	void delComment(int c_no);
	void reComment(M_commentVO m_comment);
	M_commentVO reComment_get(int c_no);
}
