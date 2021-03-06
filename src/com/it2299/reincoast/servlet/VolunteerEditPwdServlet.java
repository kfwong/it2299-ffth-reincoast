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
 * Servlet implementation class VolunteerEditPwdServlet
 */
@WebServlet("/VolunteerEditPwdServlet")
public class VolunteerEditPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerEditPwdServlet() {
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
		//AFTER fill in Password. 
				HttpSession session = request.getSession();
				
				Volunteer loginMember = (Volunteer)session.getAttribute("current_user");

				// Get Parameter from Member-edit.jsp
				String password = request.getParameter("password");
				System.out.print("password" +loginMember.getPassword());

					if ((loginMember.getPassword()).equals(request.getParameter("Current_password"))) {
						VolunteerDao volunteerdao = new VolunteerDao();
						Volunteer volunteer = volunteerdao.getByUsernameVolunteer(loginMember.getUserName());
						volunteer.setPassword(password);
						volunteerdao.saveOrUpdate(volunteer);
						
						request.setAttribute("volunteer_data", volunteer);
					//Updated Password
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("/volunteer-profile.jsp?updatedmsg=Profile%20Update!");
						requestDispatcher.forward(request, response);
					
					}
					
					else{
						//Current Password is wrong 
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("/volunteer-edit-pwd.jsp?failmsg=ERORR!%20You%27ve%20entered%20a%20wrong%20current%20password.%20%0APlease%20try%20again");
						requestDispatcher.forward(request, response);
					}

	}
	}


