package com.global.struts.action;

import org.apache.struts.actions.DispatchAction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class BaseDispatchAction extends DispatchAction {
	public Object getBean(String id) {

		ApplicationContext context = WebApplicationContextUtils
				.getRequiredWebApplicationContext(this.servlet
						.getServletContext());
		return context.getBean(id);
	}
}
