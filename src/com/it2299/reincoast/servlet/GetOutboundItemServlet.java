package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Product;

/**
 * Servlet implementation class GetOutboundItemServlet
 */
@WebServlet("/GetOutboundItemServlet")
public class GetOutboundItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOutboundItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();

		int id = Integer.parseInt(request.getParameter("ItemCode"));
		
		ProductDao productID = new ProductDao();
		
		Product product = productID.get(id);

		PrintWriter out = response.getWriter();
		String itemGson = null;
		
		if(product == null){
			System.out.println("null");
		}else{
			itemGson = gson.toJson(product);
		}
			out.println(itemGson);
		}
	

}
