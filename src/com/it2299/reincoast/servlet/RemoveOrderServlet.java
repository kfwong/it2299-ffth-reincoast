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
import javax.swing.JOptionPane;

import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.ItemDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.Stock;

/**
 * Servlet implementation class removeOrderServlet
 */
@WebServlet("/RemoveOrderServlet")
public class RemoveOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		InboundDelivery inbound = inboundDao.get(id);
		ItemDao itemDao = new ItemDao();
		List<InboundLineItem> itemList = itemDao.getList(inbound);
		
		for(int i=0; i< itemList.size(); i++){
			ProductDao productDao = new ProductDao();
			Product product = productDao.get(inbound.getItems().get(i).getProduct().getId());
			productDao.decreaseQuantity(product.getId(), inbound.getItems().get(i).getQuantity());
		}
		
			inboundDao.delete(inbound);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/success.jsp");
			requestDispatcher.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
