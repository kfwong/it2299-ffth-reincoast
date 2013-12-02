package com.it2299.reincoast.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Product;
import com.sun.org.apache.regexp.internal.recompile;

/**
 * Servlet implementation class InboundController
 */
@WebServlet("/GetItemServlet")
public class GetItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetItemServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return
	 * @return
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();

		int id = Integer.parseInt(request.getParameter("ItemCode"));
		
		ProductDao productID = new ProductDao();
		productID.openSession();
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
