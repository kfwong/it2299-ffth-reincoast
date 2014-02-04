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
 * Servlet implementation class MemberEditPwdServlet
 */
@WebServlet("/MemberEditPwdServlet")
public class MemberEditPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberEditPwdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//AFTER fill in Password. 
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("current_user");

		// Get Parameter from Member-edit.jsp
		String password = request.getParameter("password");
		System.out.print("password" +loginMember.getPassword());

			if ((loginMember.getPassword()).equals(request.getParameter("Current_password"))) {
				MemberDao memberdao = new MemberDao();
				Member member = memberdao.getByUsernameMember(loginMember.getUserName()); 
				member.setPassword(password);
				memberdao.saveOrUpdate(member);
				
				
				request.setAttribute("member_data", member);
			//Updated Password
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/member-profile.jsp?updatedmsg=Profile%20Update!");
				requestDispatcher.forward(request, response);
			
			}
			
			else{
				//Current Password is wrong 
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/member-edit-pwd.jsp?failmsg=ERORR!%20You%27ve%20entered%20a%20wrong%20current%20password.%20%0APlease%20try%20again");
				requestDispatcher.forward(request, response);
			}

		}
		
	}
	

