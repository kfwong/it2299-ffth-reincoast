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
 * Servlet implementation class ContactEditServlet
 */
@WebServlet("/ContactEditServlet")
public class ContactEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String delete = request.getParameter("delete");
		
		if(delete != null && delete.equals("true")){
			System.out.println("delete");
			String[] idArray = null;
			idArray = request.getParameterValues("id");
			ArrayList<Integer> idArrayList = new ArrayList<Integer>();
			for(int i=0; i<idArray.length; i++){
				idArrayList.add(Integer.parseInt(idArray[i]));
			}

			String [] typeArray = request.getParameterValues("type");
			
			String type = typeArray[0];
			String page = "";
			
			for(int i=0; i<idArrayList.size(); i++){
				Contact contact = new Contact();
				if(idArrayList.get(i) != -1){
					contact.setId(idArrayList.get(i));
					System.out.println(idArrayList.get(i));
				}
				ContactDao contactDao = new ContactDao();
				contactDao.delete(contact);;
			}
			
	
			switch(type){
				case "individual": page = "ContactServlet?type=individual";
				break;
				case "corporate": page = "ContactServlet?type=corporate";
				break;
				case "school": page = "ContactServlet?type=school";
				break;
				case "scc": page = "ContactServlet?type=scc";
				break;
			}
			
			response.sendRedirect(page);
		}
		else{
			String type = request.getParameter("type");
			String page = "";
			
	
			String[] idArray = null;
			idArray = request.getParameterValues("id");
			if(idArray != null){
				ArrayList<Integer> idArrayList = new ArrayList<Integer>();
				for(int i=0; i<idArray.length; i++){
					idArrayList.add(Integer.parseInt(idArray[i]));
				}
				
				ContactDao contactDao = new ContactDao();
				List<Contact> contactArray = contactDao.getAllById(idArrayList);
				
				request.setAttribute("contactArray", contactArray);
			}
			
			switch(type){
				case "individual": page = "contacts-donors-individual-edit.jsp";
				break;
				case "corporate": page = "contacts-donors-corporate-edit.jsp";
				break;
				case "school": page = "contacts-beneficiaries-school-edit.jsp";
				break;
				case "scc": page = "contacts-beneficiaries-scc-edit.jsp";
				break;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] idArray = null;
		idArray = request.getParameterValues("id");
		ArrayList<Integer> idArrayList = new ArrayList<Integer>();
		for(int i=0; i<idArray.length; i++){
			idArrayList.add(Integer.parseInt(idArray[i]));
		}
		
		String [] nameArray = request.getParameterValues("name");
		String [] addressArray = request.getParameterValues("address");
		String [] contactNumberArray = request.getParameterValues("number");
		String [] emailArray = request.getParameterValues("email");
		String [] organizationArray = request.getParameterValues("organization");
		String [] typeArray = request.getParameterValues("type");
		
		String type = typeArray[0];
		String page = "";
		
		for(int i=0; i<idArrayList.size(); i++){
			Contact contact = new Contact();
			if(idArrayList.get(i) != -1){
				contact.setId(idArrayList.get(i));
			}
			contact.setName(nameArray[i]);
			contact.setAddress(addressArray[i]);
			contact.setContactNumber(contactNumberArray[i]);
			contact.setEmail(emailArray[i]);
			contact.setOrganization(organizationArray[i]);
			contact.setType(typeArray[i]);
			
			ContactDao contactDao = new ContactDao();
			contactDao.saveOrUpdate(contact);
		}
		

		switch(type){
			case "individual": page = "ContactServlet?type=individual";
			break;
			case "corporate": page = "ContactServlet?type=corporate";
			break;
			case "school": page = "ContactServlet?type=school";
			break;
			case "scc": page = "ContactServlet?type=scc";
			break;
		}
		
		response.sendRedirect(page);
	}

}
