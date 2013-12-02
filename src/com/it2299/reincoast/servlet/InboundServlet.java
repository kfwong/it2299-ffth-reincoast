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
import com.it2299.ffth.reincoast.dto.Donation;
import com.sun.org.apache.regexp.internal.recompile;

/**
 * Servlet implementation class InboundController
 */
@WebServlet("/InboundController")
public class InboundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InboundServlet() {
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
		Donation d = new Donation();

		String item = request.getParameter("ItemCode");
		String itemPack = request.getParameter("ItemPack");

		PrintWriter out = response.getWriter();
		String itemGson = null;
		//Donation listType = (Donation) new TypeToken<ArrayList<Donation>>(){}.getType();
		/*
		if (itemPack.equals("pack1")) {
			d.setItemCode(123);
			d.setItemDescription("muhahaha");
			d.setUnitOfMeasure(200);
			d.setUnitPrice(2.90);
			//listType.getItemCode();
			//listType.getUnitOfMeasure();
			
		} else if (!item.isEmpty()) {
		*/
			if (item.equals("Hello")) {
				d.setItemCode(123);
				d.setItemDescription("muhahaha");
				d.setUnitOfMeasure(200);
				d.setUnitPrice(2.90);
				itemGson = gson.toJson(d);
			} else if (item.equals("Panda")) {
				d.setItemCode(321);
				d.setItemDescription("HELLO PANDA!!!!");
				d.setUnitOfMeasure(100);
				d.setUnitPrice(1.90);
				itemGson = gson.toJson(d);
			}
			out.println(itemGson);
		}

	//}

}
