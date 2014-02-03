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
 * Servlet implementation class MemberViewProfile
 */
@WebServlet("/MemberEditProfileServlet")
public class MemberEditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEditProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		//AFTER fill in Profile. 
	HttpSession session = request.getSession();
	Member loginMember = (Member)session.getAttribute("current_user");


	//Check Password in DB == Entered password
	if( (loginMember.getPassword()).equals(request.getParameter("Current_password"))){
	
		MemberDao memberdao = new MemberDao();
		Member member = memberdao.getByUsernameMember(loginMember.getUserName()); 
		member.setName(request.getParameter("name"));
		member.setAddress(request.getParameter("address"));
		member.setPostalCode(request.getParameter("postalCode"));
		member.setEmail(request.getParameter("email"));
		member.setTel(request.getParameter("tel"));
		memberdao.saveOrUpdate(member);

		// Forward the user to the Success page.
		request.setAttribute("member_data", member);

		//Updated Profile
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/member-profile.jsp");
		requestDispatcher.forward(request, response);
	}
	else {
			//Current password is wrong! 
			Member member = (Member)session.getAttribute("current_user");
			request.setAttribute("member_datas", member);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/member-edit.jsp");
				requestDispatcher.forward(request, response);
			
	
	}
	}
}
