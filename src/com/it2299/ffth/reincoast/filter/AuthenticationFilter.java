package com.it2299.ffth.reincoast.filter;

import java.io.IOException;
import java.net.URLEncoder;

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
		String bootstrapcss = httpRequest.getContextPath() + "/css/bootstrap.css";
		String sbadmincss = httpRequest.getContextPath() + "/css/sb-admin.css";
		String backgroundloginpng = httpRequest.getContextPath() + "/img/background-login.png"; 
		String loginJSPURL = httpRequest.getContextPath() + "/login.jsp";
		String signUpURL = httpRequest.getContextPath() + "/member-signup.jsp";
		String signUp2URL = httpRequest.getContextPath() + "/volunteer-signup.jsp";
		String loginServletURL = httpRequest.getContextPath() + "/MemberLogInServlet";
		String signupServletURL = httpRequest.getContextPath() + "/MemberSignUpServlet";
		String signupServlet2URL = httpRequest.getContextPath() + "/VolunteerSignUpServlet";
		String forgetpasswordURL = httpRequest.getContextPath() + "/forget-password.jsp";
		String forgetpwdServletURL = httpRequest.getContextPath() + "/ForgetPasswordServlet";
		String authenticateAcctURL = httpRequest.getContextPath() + "/authenticate-account.jsp";
		String authenticateAcctServlet = httpRequest.getContextPath() + "/AuthenticateAccountServlet";

		if (httpRequest.getRequestURI().equals(authenticateAcctURL)||httpRequest.getRequestURI().equals(authenticateAcctServlet)||httpRequest.getRequestURI().equals(forgetpwdServletURL)||httpRequest.getRequestURI().equals(forgetpasswordURL) || httpRequest.getRequestURI().equals(signupServlet2URL) ||httpRequest.getRequestURI().equals(signupServletURL) ||httpRequest.getRequestURI().equals(signUp2URL) ||httpRequest.getRequestURI().equals(loginJSPURL) || httpRequest.getRequestURI().equals(loginServletURL) || httpRequest.getRequestURI().equals(signUpURL) || httpRequest.getRequestURI().equals(bootstrapcss) || httpRequest.getRequestURI().equals(sbadmincss) || httpRequest.getRequestURI().equals(backgroundloginpng)) {
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
				httpResponse.sendRedirect(httpRequest.getContextPath()+ "/login.jsp");
			} else if (session.getAttribute("current_user") == null) {
				httpResponse.sendRedirect(httpRequest.getContextPath()+ "/login.jsp");
			} else {
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
