package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * Servlet implementation class GetOutboundDeliveryServlet
 */
@WebServlet("/GetOutboundDeliveryServlet")
public class GetOutboundDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetOutboundDeliveryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		OutboundDeliveryDao outboundDao = new OutboundDeliveryDao();
		
		request.setAttribute("total_item", outboundDao.getAll().size());
		if(page != 1){
			request.setAttribute("current_page", page);
			request.setAttribute("s_url", "http://localhost:8080/j2EE-it2299-ffth-reincoast/GetOutboundDeliveryServlet?page=");
		}else{
			request.setAttribute("current_page", 1);
			request.setAttribute("s_url", "http://localhost:8080/j2EE-it2299-ffth-reincoast/GetOutboundDeliveryServlet?page=");
		}
		
		List<OutboundDelivery> outboundList = outboundPaginator(page);
		request.setAttribute("outboundList", outboundList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/outbound-record.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		OutboundDeliveryDao outboundDao = new OutboundDeliveryDao();
		List<OutboundDelivery> outboundList = outboundDao.getAll();
		request.setAttribute("outboundList", outboundList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/outbound-record.jsp");
		requestDispatcher.forward(request, response);
	}
	
	@SuppressWarnings({ "unchecked", "unused" })
	private List<OutboundDelivery> outboundPaginator(int page){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query= session.createQuery("FROM OutboundDelivery");
		query.setFirstResult(5 *(page - 1));
		query.setMaxResults(5);
		
		List<OutboundDelivery> result = query.list();
		
		session.close();
		
		return result;
	}

}
