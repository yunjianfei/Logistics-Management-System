package com.global.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.global.vo.User;



public class UserLoginFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		 HttpServletRequest hrequest = (HttpServletRequest)request;

         HttpServletResponse hresponse = (HttpServletResponse)response;	
         
         HttpSession session = hrequest.getSession();
         
         User u = new User();
         
         u = (User) session.getAttribute("UserSession");
         if(u != null){
        	 chain.doFilter(request, response);
         }
         else{
        	 String msg = "<font color=red>ÇëÏÈµÇÂ¼!</font>";
        	 hrequest.setAttribute("Error_Msg", msg);
        	 hrequest.getRequestDispatcher("/index.jsp").forward(hrequest, hresponse);
         }
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
