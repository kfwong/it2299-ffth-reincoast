package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.Product;


/**
 * Servlet implementation class GetStockServlet
 */
@WebServlet("/GetStockServlet")
public class GetStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetStockServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new GsonBuilder().create();
		ProductDao productDao = new ProductDao();
		
		List<Product> productList = productDao.getAll();
		
		
		
		
		
		int totalQuan =0;
		
		for(int i=0; i< productList.size(); i++){
		totalQuan = totalQuan + productList.get(i).getQuantity();
		}
		
		
		
		
		request.setAttribute("totalQuan", totalQuan);
		request.setAttribute("stockList", productList);
		
		
		
		
		String chart = "Morris.Bar({element: 'graph',";
	    	 chart = chart + "data:[";
	    	
	    	  chart = chart + generatedChart(productList);
	    	 	
	    	 	
	    	   chart = chart + "],";
	    			   chart = chart + "xkey: 'y',";
	    			   chart = chart + "ykeys: ['a'],";
	    			   chart = chart + " labels: ['Product Quantity']";
	    			   //chart= chart + "smooth: false";
	    			   chart = chart + "});";
		request.setAttribute("mychart", chart);
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/stock.jsp");
		requestDispatcher.forward(request, response);
	}
	
	private String generatedChart(List<Product> productList){
		String chart = "";
			for(int i=0; i<productList.size() ; i++){
				
			chart = chart +  "{ y: '"+ productList.get(i).getName() + "', a: " + productList.get(i).getQuantity() + "},";
				
			}
		return chart;
	}
	//ProductSearchServlet and product database
}
