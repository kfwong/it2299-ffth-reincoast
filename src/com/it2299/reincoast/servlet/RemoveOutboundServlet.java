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
import com.it2299.ffth.reincoast.dao.ItemDao;
import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.Stock;

/**
 * Servlet implementation class RemoveOutboundServlet
 */
@WebServlet("/RemoveOutboundServlet")
public class RemoveOutboundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveOutboundServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		OutboundDeliveryDao outboundDao = new OutboundDeliveryDao();
		OutboundDelivery outbound = outboundDao.get(id);
		ItemDao itemDao = new ItemDao();
		List<OutboundLineItem> outItemList = itemDao.getOutboundList(outbound);
		for(int i=0; i< outItemList.size(); i++){
			ProductDao productDao = new ProductDao();
			productDao.increaseQuantity(outItemList.get(i).getProduct().getId(), outItemList.get(i).getQuantity());
		}
		
			outboundDao.delete(outbound);
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("GetOutboundDeliveryServlet");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
