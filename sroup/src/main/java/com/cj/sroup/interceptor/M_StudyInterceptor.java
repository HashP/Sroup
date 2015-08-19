package com.cj.sroup.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cj.sroup.dao.StudyManagementDao;

public class M_StudyInterceptor  extends HandlerInterceptorAdapter{

	@Autowired
	private StudyManagementDao studyManagementDao;
		
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
}
