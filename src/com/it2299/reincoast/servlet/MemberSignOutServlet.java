package com.it2299.reincoast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberSignOutServlet
 */
@WebServlet("/MemberSignOutServlet")
public class MemberSignOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSignOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);  
    	   
        if (session != null) {  
            session.invalidate();  
         
    	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
		System.out.println("Done ");
        } 
        else {
        	System.out.println("INcomplete");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
