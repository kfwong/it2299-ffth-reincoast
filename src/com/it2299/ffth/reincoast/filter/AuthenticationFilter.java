package com.it2299.ffth.reincoast.filter;

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

public class AuthenticationFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		// Exclusion List
		String loginJSPURL = httpRequest.getContextPath() + "/member-login.jsp";
		String signUpURL = httpRequest.getContextPath() + "/member-signup.jsp";
		String loginServletURL = httpRequest.getContextPath() + "/MemberLogInServlet";

		if (httpRequest.getRequestURI().equals(loginJSPURL) || httpRequest.getRequestURI().equals(loginServletURL) || httpRequest.getRequestURI().equals(signUpURL)) {
			chain.doFilter(request, response);
		} else if (httpRequest.getRequestURI().indexOf("/css") > 0) {
			chain.doFilter(request, response);
		} else if (httpRequest.getRequestURI().indexOf("/img") > 0) {
			chain.doFilter(request, response);
		} else if (httpRequest.getRequestURI().indexOf("/js") > 0) {
			chain.doFilter(request, response);
		} else {
			HttpSession session = httpRequest.getSession(false);
			if (session == null) {
				httpResponse.sendRedirect("member-login.jsp");
			} else if (session.getAttribute("MEMBER_DATAS") == null) {
				httpResponse.sendRedirect("member-login.jsp");
			} else {
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
