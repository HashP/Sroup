package com.cj.sroup.dao;

import java.util.List;

import com.cj.sroup.vo.MessageVO;

public interface MessageDao {

	public List<MessageVO> getMessageByReceiver (String userid) ;
	public void removeMessage(int no); 
}
