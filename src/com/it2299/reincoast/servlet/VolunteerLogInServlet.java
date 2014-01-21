package com.it2299.reincoast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.it2299.ffth.reincoast.dao.VolunteerDao;
import com.it2299.ffth.reincoast.dto.Member;
import com.it2299.ffth.reincoast.dto.Volunteer;

/**
 * Servlet implementation class VolunteerLogInServlet
 */
@WebServlet("/VolunteerLogInServlet")
public class VolunteerLogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerLogInServlet() {
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
		RequestDispatcher rd= null;
		
		String userName = request.getParameter("userName").toLowerCase();
		String password = request.getParameter("password");
		
		VolunteerDao volunteerDao = new VolunteerDao();
		boolean result = volunteerDao.authenticateVolunteer(userName, password);
		Volunteer volunteer = volunteerDao.getByUsernameVolunteer(userName);
		
		if(result ==true){
			HttpSession session = request.getSession();
			
			session.setAttribute("current-user", volunteer);
			

			rd = request.getRequestDispatcher("member-name.jsp");
			rd.forward(request, response); 
		}
		else {
			rd = getServletContext().getRequestDispatcher("/member-login.jsp");
			   rd.forward(request, response); 
			   //validatejs
		}
	}

}
