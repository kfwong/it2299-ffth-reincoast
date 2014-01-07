package com.it2299.reincoast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.it2299.ffth.reincoast.dao.MemberDao;
import com.it2299.ffth.reincoast.dto.Member;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Create Variable

		Member member = new Member();
		String[] passwords = new String[2];
		// Retrieve passwords (& CPwds) from the Textbox
		// Save them to String Array
		passwords[0] = request.getParameter("Password");
		passwords[1] = request.getParameter("CfmPassword");

		// Other Customer Detail and save to JAVA Bean
		member.setName(request.getParameter("Name"));
		member.setNric(request.getParameter("NRIC"));
		member.setContactNo(request.getParameter("Contact_No"));
		member.setUserName(request.getParameter("Username").toLowerCase());		
		member.setStatus("INACTIVE");
		member.setType("Volunteer");
		// Verify user input on passwords
				if (passwords[0].equals("") == false && passwords[0].equals(passwords[1])) {
					// If passwords are the same and password is not empty
					// save the password to the Customer Java bean.
					member.setPassword(passwords[0]); 
				} else {
					// If verification fails, forward user to error page.
					RequestDispatcher rd = request.getRequestDispatcher("Member_SignUp.jsp");
					rd.forward(request, response);
					return;
				}
				try {

					//If successful, ADD INTO Database ^^V
					
					MemberDao memberDao = new MemberDao();
					memberDao.saveOrUpdate(member);
					
					
					// Forward the user to the Success page.
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
				} catch (Exception ex) {
					throw new ServletException(ex);
				}
		
	}

}
