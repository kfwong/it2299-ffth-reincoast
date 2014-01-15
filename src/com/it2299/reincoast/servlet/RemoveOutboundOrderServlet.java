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
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.Stock;

/**
 * Servlet implementation class RemoveOutboundOrderServlet
 */
@WebServlet("/RemoveOutboundOrderServlet")
public class RemoveOutboundOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveOutboundOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("start remove");
		int id = Integer.parseInt(request.getParameter("id"));
		
		OutboundDelivery outbound = new OutboundDelivery();
		outbound.setId(id);
		ItemDao itemDao = new ItemDao();
		List<OutboundLineItem> itemList = itemDao.getOutboundList(outbound);
		StockDao stockDao = new StockDao();
		for(int i=0; i< itemList.size(); i++){
			int totalQuantity = stockDao.getProductStock(itemList.get(i).getProduct()).getQuantity() + itemList.get(i).getQuantity();
			Stock stock = new Stock();
			stock.setQuantity(totalQuantity);
			stock.setProduct(itemList.get(i).getProduct());
			stockDao.updateStock(stock);
			itemDao.deleteOutbound(itemList.get(i));
		}
		
		OutboundDeliveryDao outboundDao = new OutboundDeliveryDao();
		outboundDao.delete(outbound);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/success-outbound.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
