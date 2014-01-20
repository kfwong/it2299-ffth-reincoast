package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.util.Email;

/**
 * Servlet implementation class TestMailServlet
 */
@WebServlet("/TestMailServlet")
public class TestMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Email email = new Email();
		email.setFrom("REINCOAST Alert <alert@reincoast-kfwong.rhcloud.com>");
		email.setTo("whitekoffee@gmail.com");
		email.setSubject("Testing for mailgun.");
		email.setMessage("Testing message.");
		
		
		PrintWriter out = response.getWriter();
		out.println(email.send().toString());
	}
}
