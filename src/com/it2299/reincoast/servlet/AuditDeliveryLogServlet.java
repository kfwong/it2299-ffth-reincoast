package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.AuditDeliveryDao;
import com.it2299.ffth.reincoast.dto.AuditDelivery;

/**
 * Servlet implementation class AuditDeliveryLogServlet
 */
@WebServlet("/AuditDeliveryLogServlet")
public class AuditDeliveryLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuditDeliveryLogServlet() {
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
		AuditDeliveryDao delivery = new AuditDeliveryDao();
		List<AuditDelivery> auditDelivery = delivery.getAll();
		request.setAttribute("auditDelivery", auditDelivery);
		RequestDispatcher rd = request.getRequestDispatcher("/historyItem.jsp");
		rd.forward(request, response);
	}

}
