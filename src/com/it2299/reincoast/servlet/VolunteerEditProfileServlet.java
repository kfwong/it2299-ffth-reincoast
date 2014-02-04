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
 * Servlet implementation class VolunteerEditProfileServlet
 */
@WebServlet("/VolunteerEditProfileServlet")
public class VolunteerEditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerEditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		//AFTER fill in Profile. 
	HttpSession session = request.getSession();
	Volunteer loginMember = (Volunteer)session.getAttribute("current_user");


	//Check Password in DB == Entered password
	if( (loginMember.getPassword()).equals(request.getParameter("Current_password"))){
		VolunteerDao volunteerdao = new VolunteerDao();
		Volunteer volunteer = volunteerdao.getByUsernameVolunteer(loginMember.getUserName());
		
		volunteer.setName(request.getParameter("name"));
		volunteer.setAddress(request.getParameter("address"));
		volunteer.setPostalCode(request.getParameter("postalCode"));
		volunteer.setEmail(request.getParameter("email"));
		volunteer.setTel(request.getParameter("tel"));
		volunteerdao.saveOrUpdate(volunteer);

		// Forward the user to the Success page.
		request.setAttribute("volunteer_data", volunteer);

		//Updated Profile
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/volunteer-profile.jsp");
		requestDispatcher.forward(request, response);
	}
	else {
				// Password is wrongly entered, mismatch
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/volunteer-edit.jsp");
				requestDispatcher.forward(request, response);
			
	
	}
	}
}
