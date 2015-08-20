package com.cj.sroup.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.cj.sroup.vo.M_commentVO;


public interface M_commentService {
	void addComment(M_commentVO m_comment);
	List<M_commentVO> getAllComment(int study_no);
	List<M_commentVO> getdateComment(HashMap<String, String> param);
	void delComment(int c_no);
	M_commentVO rewriteComment(M_commentVO m_comment);
}
