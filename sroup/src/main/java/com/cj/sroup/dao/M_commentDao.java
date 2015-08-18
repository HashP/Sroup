package com.cj.sroup.dao;

import java.util.HashMap;
import java.util.List;

import com.cj.sroup.vo.M_commentVO;

public interface M_commentDao {
	void addComment(M_commentVO m_comment);
	List<M_commentVO> getAllComment(int study_no);
	List<M_commentVO> getdateComment(HashMap<String, String> param);
	void delComment(int c_no);
	void reComment(M_commentVO m_comment);
	M_commentVO reComment_get(int c_no);
}
