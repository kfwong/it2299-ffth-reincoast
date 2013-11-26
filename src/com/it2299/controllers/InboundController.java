package com.it2299.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.it2299.beans.Donation;
import com.sun.org.apache.regexp.internal.recompile;

/**
 * Servlet implementation class InboundController
 */
@WebServlet("/InboundController")
public class InboundController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InboundController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @return 
	 * @return 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		Donation d = new Donation();
		String [] itemArray = new String[5];
		String item = request.getParameter("ItemCode");
		PrintWriter out = response.getWriter();
		String itemGson = null;
		
		if(item.equals("Hello")){
			d.setItemCode(123);
			d.setItemDescription("muhahaha");
			d.setUnitOfMeasure(200);
			d.setUnitPrice(2.90);
			itemGson = gson.toJson(d);
		}else if(item.equals("Panda")){
			d.setItemCode(321);
			d.setItemDescription("HELLO PANDA!!!!");
			d.setUnitOfMeasure(100);
			d.setUnitPrice(1.90);
			itemGson = gson.toJson(d);
		}
			out.println(itemGson);
	}
	
	
	

}
