package com.it2299.reincoast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.MemberDao;
import com.it2299.ffth.reincoast.dao.VolunteerDao;
import com.it2299.ffth.reincoast.dto.Member;
import com.it2299.ffth.reincoast.dto.Volunteer;

/**
 * Servlet implementation class AuthenticateAccountServlet
 */
@WebServlet("/AuthenticateAccountServlet")
public class AuthenticateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthenticateAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		String userName = request.getParameter("username").toLowerCase();
		String tempPassword = request.getParameter("tempPwd"); 
		String status = request.getParameter("role");
		String pwd = request.getParameter("pwd");

		
		if (status.equals("STAFF")) {
			MemberDao memberdao = new MemberDao();
			Member member = memberdao.getByUsernameMember(userName);
			System.out.println("Member name : " + member.getName());
			if (member!=null && member.getrPwd()!=null && member.getrPwd()==tempPassword){
				member.setPassword(pwd);
				member.setrPwd(null);
				memberdao.saveOrUpdate(member);
		    	rd = request.getRequestDispatcher("/login.jsp?msg=You%20have%20successfully%20changed%20your%20password&isType=alert-success");
				rd.forward(request, response);
				
			}
			
			else if(member!=null && member.getrPwd()==null){
				rd = request.getRequestDispatcher("/authenticate-account.jsp?msg=Please%20request%20%5Bchange%20password%20instruction%5D%20again.%20.&isType=alert-danger");
				rd.forward(request, response);
			}
			else if(member!=null && member.getrPwd()!=null && member.getrPwd()!=tempPassword){
				rd = request.getRequestDispatcher("/authenticate-account.jsp?msg=The%20unique%20code%20is%20wrongly%20entered.%20Please%20enter%20a%20valid%20unique%20code%2C%20it%20can%20be%20found%20in%20your%20email.&isType=alert-danger");
				rd.forward(request, response);
			}
			
		}else if (status.equals("VOLUNTEER")) {
	
		VolunteerDao volunteerdao = new VolunteerDao();
		Volunteer volunteer = volunteerdao.getByUsernameVolunteer(userName);
		System.out.println("Member code : " + volunteer.getrPwd());
		
			if (volunteer!=null && volunteer.getrPwd()!=null && volunteer.getrPwd().equals(tempPassword)){
				volunteer.setPassword(pwd);
				volunteer.setrPwd(null);
				volunteerdao.saveOrUpdate(volunteer);
				rd = request.getRequestDispatcher("/login.jsp?msg=You%20have%20successfully%20changed%20your%20passwordt&isType=alert-success");
				rd.forward(request, response);
			}

			else if(volunteer!=null && volunteer.getrPwd()==null){
				rd = request.getRequestDispatcher("/authenticate-account.jsp?msg=Please%20request%20%5Bchange%20password%20instruction%5D%20again.%20.&isType=alert-danger");
				rd.forward(request, response);
			}
			else if(volunteer!=null && volunteer.getrPwd()!=null && !volunteer.getrPwd().equals(tempPassword)){
				rd = request.getRequestDispatcher("/authenticate-account.jsp?msg=The%20unique%20code%20is%20wrongly%20entered.%20Please%20enter%20a%20valid%20unique%20code%2C%20it%20can%20be%20found%20in%20your%20email.&isType=alert-danger");
				rd.forward(request, response);
			}
			
		}
	}

}
