package com.global.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	String encode = null;

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(encode);
		response.setCharacterEncoding(encode);

		chain.doFilter(request, response);
	}

	public void init(FilterConfig config) throws ServletException {
		encode = config.getInitParameter("encode");
	}

}
