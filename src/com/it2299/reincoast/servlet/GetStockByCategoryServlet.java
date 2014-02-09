package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * Servlet implementation class GetStockByCategoryServlet
 */
@WebServlet("/GetStockByCategoryServlet")
public class GetStockByCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStockByCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    	int page = Integer.parseInt(request.getParameter("page"));
		String type = request.getParameter("category");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("category", type);
		ProductDao productDao = new ProductDao();
		
		List<Product> productList =  productPaginator(page, type);
				
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
			request.setAttribute("s_url", "http://localhost:8080/j2EE-it2299-ffth-reincoast/GetStockByCategoryServlet?page=");
			request.setAttribute("url_type", "&category=");
		}else{
			request.setAttribute("current_page", 1);
			request.setAttribute("s_url", "http://localhost:8080/j2EE-it2299-ffth-reincoast/GetStockByCategoryServlet?page=");
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

	private List<Product> productPaginator(int page, String type){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		
		Query query= session.createQuery("FROM Product WHERE category = :category");
		query.setParameter("category", type);
		query.setFirstResult(5 *(page - 1));
		query.setMaxResults(5);
		
		List<Product> result = query.list();
		
		session.close();
		
		return result;
	}
}
