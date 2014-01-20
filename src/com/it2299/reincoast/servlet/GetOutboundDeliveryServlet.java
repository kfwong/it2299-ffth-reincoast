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
import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;

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
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET");
		OutboundDeliveryDao outboundDao = new OutboundDeliveryDao();
		List<OutboundDelivery> outboundList = outboundDao.getAll();
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
		System.out.println("POST");
		OutboundDeliveryDao outboundDao = new OutboundDeliveryDao();
		List<OutboundDelivery> outboundList = outboundDao.getAll();
		request.setAttribute("outboundList", outboundList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/outbound-record.jsp");
		requestDispatcher.forward(request, response);
	}

}
