package com.it2299.reincoast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.MemberDao;
import com.it2299.ffth.reincoast.dao.VolunteerDao;
import com.it2299.ffth.reincoast.dto.Member;
import com.it2299.ffth.reincoast.dto.Volunteer;

/**
 * Servlet implementation class VolunteerSignUp
 */
@WebServlet("/VolunteerSignUp")
public class VolunteerSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerSignUp() {
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

		Volunteer volunteer = new Volunteer();
		String[] passwords = new String[2];
		// Retrieve passwords (& CPwds) from the Textbox
		// Save them to String Array
		passwords[0] = request.getParameter("Password");
		passwords[1] = request.getParameter("CfmPassword");

		// Other Customer Detail and save to JAVA Bean
		volunteer.setName(request.getParameter("Name"));
		volunteer.setNric(request.getParameter("NRIC"));
		volunteer.setGender(request.getParameter("Gender"));
		volunteer.setEmail(request.getParameter("Email"));
		volunteer.setAddress(request.getParameter("Address"));
		volunteer.setPostalCode(request.getParameter("PostalCode"));
		volunteer.setTel(request.getParameter("Tel"));
		volunteer.setUserName(request.getParameter("Username").toLowerCase());		
		volunteer.setStatus("ACTIVE");

		// Verify user input on passwords
				if (passwords[0].equals("") == false && passwords[0].equals(passwords[1])) {
					// If passwords are the same and password is not empty
					// save the password to the Customer Java bean.
					volunteer.setPassword(passwords[0]); 
				} else {
					// If verification fails, forward user to error page.
					RequestDispatcher rd = request.getRequestDispatcher("volunteer-signup.jsp");
					rd.forward(request, response);
					return;
				}
				try {

					//If successful, ADD INTO Database ^^V
					
					VolunteerDao volunteerdao = new VolunteerDao();
					volunteerdao.saveOrUpdate(volunteer);
					
					
					// Forward the user to the Success page.
					RequestDispatcher rd = request.getRequestDispatcher("member-login.jsp");
					rd.forward(request, response);
				} catch (Exception ex) {
					throw new ServletException(ex);
				}
		
	}
}
