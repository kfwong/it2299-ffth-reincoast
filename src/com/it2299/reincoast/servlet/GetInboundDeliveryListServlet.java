package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;

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

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		List<InboundDelivery> inboundList = inboundDao.getAll();

		request.setAttribute("inboundList", inboundList);

		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("/inbound-record.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		List<InboundDelivery> inboundList = inboundDao.getAll();

		request.setAttribute("inboundList", inboundList);

		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("/inbound-record.jsp");
		requestDispatcher.forward(request, response);
	}
}
