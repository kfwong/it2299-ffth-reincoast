package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.ContactDao;
import com.it2299.ffth.reincoast.dto.Contact;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ContactDao contactDao = new ContactDao();
		List<Contact> contactArray = contactDao.getAll();
		
		request.setAttribute("contactArray", contactArray);
		RequestDispatcher rd = request.getRequestDispatcher("contacts-donors-individual.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String [] nameArray = request.getParameterValues("name");
		String [] addressArray = request.getParameterValues("address");
		String [] contactNumberArray = request.getParameterValues("number");
		String [] emailArray = request.getParameterValues("email");
		String [] organizationArray = request.getParameterValues("organization");
		
		
		for(int i=0; i<nameArray.length; i++){
			Contact contact = new Contact();
			contact.setName(nameArray[i]);
			contact.setAddress(addressArray[i]);
			contact.setContactNumber(contactNumberArray[i]);
			contact.setEmail(emailArray[i]);
			contact.setOrganization(organizationArray[i]);
			
			ContactDao contactDao = new ContactDao();
			contactDao.saveOrUpdate(contact);
			
			response.sendRedirect("contacts-donors-individual.jsp");
		}
	}

}
