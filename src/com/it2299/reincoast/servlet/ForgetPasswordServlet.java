package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

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
import com.it2299.ffth.reincoast.util.Email;

/**
 * Servlet implementation class ForgetPasswordServlet
 */
@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgetPasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
		
		/******************************************/
		UUID uuid = UUID.randomUUID();
		String tempPwd = uuid.toString().substring(0, 8);
		System.out.println("PASSWORD TEMP" + tempPwd);
	
		/******************************************/

		String emailAdd = request.getParameter("email");
		String role = request.getParameter("role");


		if (role.equals("STAFF")) {
			MemberDao memberdao = new MemberDao();
			Member member = memberdao.getByEmailMember(emailAdd);

			String text = "Hi, Reincoast received a request to reset the password for your account.Copy the following url and paste in your brower to change your password" ;
			
			String url = "  http://localhost:8080/it2299-ffth-reincoast-project/authenticate-account.jsp ";
			String pwdCode = "Code : " + (tempPwd);
			if (member != null && member.getStatus().equals("ACTIVE")) {
				// save a new password in RESET_PASSWORD
				member.setrPwd(tempPwd);
				memberdao.saveOrUpdate(member);
				String Memail = member.getEmail();
				Email email = new Email();
				email.setFrom("REINCOAST Alert <alert@reincoast-kfwong.rhcloud.com>");
				email.setTo(Memail);
				email.setSubject("Testing for mailgun.");
				email.setMessage(text + url + pwdCode);
				
				
				
				
				
				System.out.println(" Email = " + email.send());

				rd = request
						.getRequestDispatcher("/forget-password.jsp?msg=Password%20reset%20instructions%20has%20been%20send%20to%20your%20Email.%20&isType=alert-success");
				rd.forward(request, response);

			}
		
			else if (member == null || member.getStatus().equals("INACTIVE")) {
				rd = request.getRequestDispatcher("/forget-password.jsp?msg=Member%20does%20not%20exist%2C%20are%20you%20sure%20you%20entered%20the%20valid%20Email%3F%20&isType=alert-danger");
				rd.forward(request, response);
			}

			
			

		} else if (role.equals("VOLUNTEER")) {

			VolunteerDao volunteerdao = new VolunteerDao();
			Volunteer volunteer = volunteerdao.getByEmailVolunteer(emailAdd);
			if (volunteer.getStatus().equals("ACTIVE")) {
				System.out.print("Status " + volunteer.getStatus());
				// save a new password in RESET_PASSWORD
				volunteer.setrPwd(tempPwd);
				volunteerdao.saveOrUpdate(volunteer);
				String Vemail = volunteer.getEmail();

				Email email = new Email();
				email.setFrom("REINCOAST Alert <alert@reincoast-kfwong.rhcloud.com>");
				email.setTo(Vemail);
				email.setSubject("Testing for mailgun.");
				email.setMessage("Password is " + tempPwd);
				System.out.println(" Email = " + email.send());

				rd = request.getRequestDispatcher("/forget-password.jsp?msg=Password%20reset%20instructions%20has%20been%20send%20to%20your%20Email.%20&isType=alert-success");
				rd.forward(request, response);

			} else if (volunteer== null ||volunteer.getStatus().equals("INACTIVE")) {
				rd = request.getRequestDispatcher("/forget-password.jsp?msg=Member%20does%20not%20exist%2C%20are%20you%20sure%20you%20entered%20the%20valid%20Email%3F%20&isType=alert-danger");
				rd.forward(request, response);;
			}

			else {
				rd = request
						.getRequestDispatcher("/forget-password.jsp?msg=User%20cannot%20be%20found%2C%20please%20try%20again.%20&isType=alert-danger");
				rd.forward(request, response);
			}

		}

	}
}
