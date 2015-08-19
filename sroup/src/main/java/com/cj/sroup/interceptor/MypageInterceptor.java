package com.cj.sroup.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cj.sroup.dao.MessageDao;
import com.cj.sroup.dao.listDao;
import com.cj.sroup.vo.ListVO;
import com.cj.sroup.vo.MessageVO;

public class MypageInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MessageDao messageDao;
	@Autowired
	private listDao listdao;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
	
		HttpSession session = request.getSession();
		if(session != null) {
			String loginId = (String) session.getAttribute("LOGIN_ID");

			if(loginId != null) {
				return true;			
			}
		}
		
		session.setAttribute("needLogin", "NEED");
		response.sendRedirect("/sroup/login/login.do");
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("LOGIN_ID");
		
		List<MessageVO> navmsgList = messageDao.getMessageForNav(loginId);
		modelAndView.addObject("navmsgList", navmsgList);
		
		List<ListVO> lists = listdao.getAllStudiesDefault();
		modelAndView.addObject("lists", lists);
		//super.postHandle(request, response, handler, modelAndView);
	}
}
