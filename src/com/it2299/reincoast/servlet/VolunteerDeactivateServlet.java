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
 * Servlet implementation class VolunteerDeactivateServlet
 */
@WebServlet("/VolunteerDeactivateServlet")
public class VolunteerDeactivateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerDeactivateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("before get session");
		HttpSession session = request.getSession();
		Volunteer volunteer = (Volunteer)session.getAttribute("current_user");
		
		String Uname = (volunteer.getUserName());
		System.out.println("before deactivate");
		try {
			VolunteerDao volunteerdao = new VolunteerDao();
			Volunteer currentMem = volunteerdao.getByUsernameVolunteer(Uname);

			currentMem.setStatus("INACTIVE");
			volunteerdao.saveOrUpdate(currentMem);
			System.out.println("DEACTIVATED DONE!");
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		

		} catch (Exception ex) {
			throw new ServletException(ex);

		}
	}
}
