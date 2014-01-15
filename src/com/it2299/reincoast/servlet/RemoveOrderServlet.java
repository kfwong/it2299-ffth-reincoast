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
		System.out.println("start");
		int id = Integer.parseInt(request.getParameter("id"));
		
		
		InboundDelivery inbound = new InboundDelivery();
		inbound.setId(id);
		
		ItemDao itemDao = new ItemDao();
		StockDao stockDao = new StockDao();
		List<InboundLineItem> itemList = itemDao.getList(inbound);
		
		for(int i=0; i< itemList.size(); i++){
			Stock stock = new Stock();
			Stock currentStock = stockDao.getProductStock(itemList.get(i).getProduct());
			 
			int quantity= 0;
			System.out.println(itemList.get(i).getProduct().getId());
			Product product = new Product();
			product.setId(itemList.get(i).getProduct().getId());
			
			if(currentStock.getQuantity() > itemList.get(i).getQuantity()){
				quantity = (currentStock.getQuantity() - itemList.get(i).getQuantity());
				stock.setQuantity(quantity);
				stock.setProduct(product);
				stockDao.updateStock(stock);
			}else{
				System.out.println("Not enough");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/remove-failed.jsp");
				requestDispatcher.forward(request, response);
			}
			itemDao.delete(itemList.get(i));
		}
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		inboundDao.delete(inbound);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("GetInboundDeliveryListServlet");
		requestDispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
