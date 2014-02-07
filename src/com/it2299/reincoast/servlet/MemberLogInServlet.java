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
import com.it2299.ffth.reincoast.dao.VolunteerDao;
import com.it2299.ffth.reincoast.dto.Member;
import com.it2299.ffth.reincoast.dto.Volunteer;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/MemberLogInServlet")
public class MemberLogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogInServlet() {
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
		
		
		String userName = request.getParameter("username").toLowerCase();
		String password = request.getParameter("password");
		String status = request.getParameter("role");

		if (status.equals("STAFF")) {
			MemberDao memberdao = new MemberDao();
			boolean result = memberdao.authenticateMember(userName, password, status);
			Member member = memberdao.getByUsernameMember(userName);

			if (result == true) {
				HttpSession session = request.getSession();

				session.setAttribute("current_user", member);

				rd = request.getRequestDispatcher("dashboard.jsp");
				rd.forward(request, response);
			}else 
			{
				rd = getServletContext().getRequestDispatcher("/login.jsp?msg=Invalid%20Username%20Or%20Password.%20Please%20Try%20Again!&isType=alert-danger");
				rd.forward(request, response);
			}
			
				
		}
		
		
		else if (status.equals("VOLUNTEER")) {
				VolunteerDao volunteerDao = new VolunteerDao();
				boolean results = volunteerDao.authenticateVolunteer(userName,password, status);
				Volunteer volunteer = volunteerDao.getByUsernameVolunteer(userName);

				if (results == true) {
					HttpSession session = request.getSession();

					session.setAttribute("current_user", volunteer);

					rd = request.getRequestDispatcher("v-dashboard.jsp");
					rd.forward(request, response);
				}else 
				{
					rd = getServletContext().getRequestDispatcher("/login.jsp");
					rd.forward(request, response);
				}
				
		}	else {
			rd = getServletContext().getRequestDispatcher("/login.jsp?msg=Invalid%20Username%20Or%20Password.%20Please%20Try%20Again!&isType=alert-danger");
			rd.forward(request, response); 
			   //validatejs
		}
		
	
		
				
				
	}

}
