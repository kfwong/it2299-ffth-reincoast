package com.it2299.reincoast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.it2299.ffth.reincoast.dto.Volunteer;

/**
 * Servlet implementation class VolunteerViewProfileServlet
 */
@WebServlet("/VolunteerViewProfileServlet")
public class VolunteerViewProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerViewProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Display Profile (non-editable)
		HttpSession session = request.getSession();
		Volunteer volunteer = (Volunteer)session.getAttribute("current_user");
		request.setAttribute("volunteer_data", volunteer);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/volunteer-profile.jsp?isHidden=hidden");
		requestDispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Display Profile (editable)
				HttpSession session = request.getSession();
				Volunteer volunteer = (Volunteer)session.getAttribute("current_user");
				request.setAttribute("volunteer_datas", volunteer);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/volunteer-edit.jsp?isHidden=hidden");
				requestDispatcher.forward(request, response);
	}

}
