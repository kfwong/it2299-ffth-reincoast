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
@WebServlet("/MemberViewProfileServlet")
public class MemberViewProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession();
				Member member = (Member)session.getAttribute("current_user");
				request.setAttribute("member_data", member);
				
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/member-profile.jsp");
				requestDispatcher.forward(request, response);
			
		
	}

	
	

}
