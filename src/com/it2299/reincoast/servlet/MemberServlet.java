package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.it2299.ffth.reincoast.dto.Member;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		// String userName = request.getParameter("username");
		// String userPass = request.getParameter("userPassword");
		// String userRePass = request.getParameter("userCPassword");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Create Variable
		HttpSession session;
		Member member = new Member();
		String[] passwords = new String[2];
		// Retrieve passwords (& CPwds) from the Textbox
		// Save them to String Array
		passwords[0] = request.getParameter("password");
		passwords[1] = request.getParameter("Cfmpassword");

		// Other Customer Detail and save to JAVA Bean
		Member.setName(request.getParameter("Name"));
		Member.setNRIC(request.getParameter("NRIC"));
		Member.setType(request.getParameter("Type"));
		Member.setContactNo(request.getParameter("Contact_NO"));
		Member.setStatus("INACTIVE");

		// Verify user input on passwords
		if (passwords[0].equals("") == false
				&& passwords[0].equals(passwords[1])) {
			// If passwords are the same and password is not empty
			// save the password to the Customer Java bean.
			Member.setPassword(passwords[0]);
		} else {
			// If verification fails, forward user to error page.
			RequestDispatcher rd = request.getRequestDispatcher("Error.html");
			rd.forward(request, response);
			return;
		}
		try {
			// If everything is alright, save the Java bean to user session
			session = request.getSession();
			session.setAttribute("MEMBER_DATA", member);
			// Forward the user to the Success page.
			RequestDispatcher rd = request.getRequestDispatcher("Success.html");
			rd.forward(request, response);
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

}
