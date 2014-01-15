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
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
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
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("start");
		int id = Integer.parseInt(request.getParameter("id"));

		InboundDelivery inbound = new InboundDelivery();
		inbound.setId(id);

		ItemDao itemDao = new ItemDao();
		StockDao stockDao = new StockDao();
		List<InboundLineItem> itemList = itemDao.getList(inbound);

		for (int i = 0; i < itemList.size(); i++) {
			Product product = new Product();
			product.setId(itemList.get(i).getProduct().getId());
			if (stockDao.find(product)) {
				Stock stock = new Stock();
				Stock currentStock = stockDao.getProductStock(itemList.get(i)
						.getProduct());

				int quantity = 0;

				quantity = (currentStock.getQuantity() + itemList.get(i)
						.getQuantity());
				stock.setQuantity(quantity);
				stock.setProduct(product);
				stockDao.updateStock(stock);

				itemDao.delete(itemList.get(i));
			} else {
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("/remove-failed.jsp");
				requestDispatcher.forward(request, response);
			}

		}
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		inboundDao.delete(inbound);
		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("GetInboundDeliveryListServlet");
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
