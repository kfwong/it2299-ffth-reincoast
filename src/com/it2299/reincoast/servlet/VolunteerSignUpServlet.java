package com.it2299.reincoast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.VolunteerDao;
import com.it2299.ffth.reincoast.dto.Volunteer;

/**
 * Servlet implementation class VolunteerSignUp
 */
@WebServlet("/VolunteerSignUpServlet")
public class VolunteerSignUpServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VolunteerSignUpServlet() {
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

                Volunteer volunteer = new Volunteer();
           
                // Retrieve passwords (& CPwds) from the Textbox
              
                String pwd = request.getParameter("Password");
                String cfmPwd = request.getParameter("CfmPassword");

                // Other Customer Detail and save to JAVA Bean
                volunteer.setName(request.getParameter("Name"));
                volunteer.setNric(request.getParameter("NRIC"));
                String value = request.getParameter("Gender");
                volunteer.setGender(value);
                volunteer.setEmail(request.getParameter("Email"));
                volunteer.setAddress(request.getParameter("Address"));
                volunteer.setPostalCode(request.getParameter("PostalCode"));
                volunteer.setTel(request.getParameter("Tel"));
                volunteer.setUserName(request.getParameter("Username").toLowerCase());                
                volunteer.setStatus("ACTIVE");
                volunteer.setrPwd(null);

                // Verify user input on passwords
                                if ((pwd.equals("")==false) && (pwd.equals(cfmPwd))) {
                                        // If passwords are the same and password is not empty
                                        // save the password to the Customer Java bean.
                                        volunteer.setPassword(pwd); 
                                } else {
                                        // If verification fails, forward user to error page.
                                        RequestDispatcher rd = request.getRequestDispatcher("volunteer-signup.jsp");
                                        rd.forward(request, response);
                                        return;
                                }
                                try {
                                	
                                        //If successful, ADD INTO Database ^^V
                                        VolunteerDao volunteerdao = new VolunteerDao();
                                        volunteerdao.saveOrUpdate(volunteer);

                                        // Forward the user to the Success page.
                                        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                                        rd.forward(request, response);
                                } catch (Exception ex) {
                                        throw new ServletException(ex);
                                }
                
        }
}