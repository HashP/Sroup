package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.M_boardVO;
import com.cj.sroup.vo.M_noticeVO;



public interface M_noticeDao {
	void addNotice(M_noticeVO m_notice);
	List<M_noticeVO> getAllNotice();
	void delNotice(int n_no);
	void reNotice(M_noticeVO m_notice);
	M_noticeVO reNoticeInfo(int n_no);
}
