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
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * Servlet implementation class GetDeliveryList
 */
@WebServlet("/GetInboundDeliveryListServlet")
public class GetInboundDeliveryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetInboundDeliveryListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		request.setAttribute("total_item", inboundDao.getAll().size());
		if(page != 1){
			request.setAttribute("current_page", page);
			request.setAttribute("s_url", "GetInboundDeliveryListServlet?page=");
		}else{
			request.setAttribute("current_page", 1);
			request.setAttribute("s_url", "GetInboundDeliveryListServlet?page=");
		}
		List<InboundDelivery> inboundList = inboundPaginator(page);

		request.setAttribute("inboundList", inboundList);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/inbound-record.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		List<InboundDelivery> inboundList = inboundDao.getAll();

		request.setAttribute("inboundList", inboundList);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/inbound-record.jsp");
		requestDispatcher.forward(request, response);
	}
	
	@SuppressWarnings({ "unchecked", "unused" })
	private List<InboundDelivery> inboundPaginator(int page){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query= session.createQuery("FROM InboundDelivery");
		query.setFirstResult(5 *(page - 1));
		query.setMaxResults(5);
		
		List<InboundDelivery> result = query.list();
		
		session.close();
		
		return result;
	}
}
