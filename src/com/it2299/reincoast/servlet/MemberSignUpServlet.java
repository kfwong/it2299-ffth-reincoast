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
@WebServlet("/MemberSignUpServlet")
public class MemberSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberSignUpServlet() {
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

		// Retrieve passwords (& CPwds) from the Textbox


		// Other Customer Detail and save to JAVA Bean
		member.setName(request.getParameter("Name"));
		member.setNric(request.getParameter("NRIC"));
		member.setGender(request.getParameter("Gender"));
		member.setEmail(request.getParameter("Email"));
		member.setAddress(request.getParameter("Address"));
		member.setPostalCode(request.getParameter("PostalCode"));
		member.setTel(request.getParameter("Tel"));
		member.setUserName(request.getParameter("Username").toLowerCase());		
		member.setStatus("ACTIVE");
		//Set Password to NRIC first. 
		member.setPassword(request.getParameter("NRIC"));
		
				try {

					//If successful, ADD INTO Database ^^V
					
					MemberDao memberDao = new MemberDao();
					memberDao.saveOrUpdate(member);
					
					
					// Forward the user to the Success page.
					RequestDispatcher rd = request.getRequestDispatcher("member-login.jsp");
					rd.forward(request, response);
				} catch (Exception ex) {
					throw new ServletException(ex);
				}
		
	}

}
