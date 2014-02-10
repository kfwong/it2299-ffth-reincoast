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

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextQuery;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.Contact;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;


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

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		ProductDao productDao = new ProductDao();
		
		List<Product> productList =  productPaginator(page);
				
		int totalQuan =0;
		
		for(int i=0; i< productList.size(); i++){
		totalQuan = totalQuan + productList.get(i).getQuantity();
		}
		request.setAttribute("total_size", productList.size());
		request.setAttribute("totalQuan", totalQuan);
		request.setAttribute("stockList", productList);
		request.setAttribute("total_item", productDao.getAll().size());
		if(page != 1){
			
			request.setAttribute("current_page", page);
			request.setAttribute("s_url", "GetStockServlet?page=");
			request.setAttribute("url_type", "&category=");
		}else{
			request.setAttribute("current_page", 1);
			request.setAttribute("s_url", "GetStockServlet?page=");
			request.setAttribute("url_type", "&category=");
		}
		
		String chart = "Morris.Bar({element: 'graph',";
	    	 chart = chart + "data:[";
	    	
	    	  chart = chart + generatedChart(productList);
	    	 	
	    	   chart = chart + "],";
	    			   chart = chart + "xkey: 'y',";
	    			   chart = chart + "ykeys: ['a'],";
	    			   chart = chart + " labels: ['Product Quantity']";
	    			   chart = chart + "})";
		request.setAttribute("mychart", chart);
		
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/stock.jsp");
		requestDispatcher.forward(request, response);
		
	}
	
	private String generatedChart(List<Product> productList){
		String chart = "";
			for(int i=0; i<productList.size() ; i++){
				if(productList.size()-1 == i){
					chart = chart +  "{ y: '"+ StringEscapeUtils.escapeXml(productList.get(i).getName()) + "', a: " + productList.get(i).getQuantity() + "}";
				}else{
			chart = chart +  "{ y: '"+ StringEscapeUtils.escapeXml(productList.get(i).getName()) + "', a: " + productList.get(i).getQuantity() + "},";
				}
			}
		return chart;
	}
	
	@SuppressWarnings({ "unchecked"})
	private List<Product> productPaginator(int page){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query= session.createQuery("FROM Product");
		query.setFirstResult(4 *(page - 1));
		query.setMaxResults(4);
		
		List<Product> result = query.list();
		
		session.close();
		
		return result;
	}
	
	
}
