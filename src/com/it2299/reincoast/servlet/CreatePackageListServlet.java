package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.PackingDao;
import com.it2299.ffth.reincoast.dto.Packing;
import com.it2299.ffth.reincoast.dto.PackingLineItem;
import com.it2299.ffth.reincoast.dto.Product;

@WebServlet("/CreatePackageListServlet")
public class CreatePackageListServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CreatePackageListServlet(){
		super();
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		Packing packing = new Packing();
		List<PackingLineItem> packingLineItems = new ArrayList<PackingLineItem>();
		packing.setPackageName(request.getParameter("packageName"));
		
		String[] id = request.getParameterValues("item-code");
		String colCenter = request.getParameter("colCenter");
		
		for(int i=0; i< id.length;i++){
			
			PackingLineItem packingLineItem = new PackingLineItem();
			packingLineItem.setPacking(packing);
			Product product = new Product();
			product.setId(Integer.parseInt(id[i]));
			packingLineItem.setProduct(product);
			packingLineItems.add(packingLineItem);
		}
		packing.setCol_center(colCenter);
		packing.setPackItem(packingLineItems);
		
		PackingDao pListDao = new PackingDao();
		pListDao.saveOrUpdate(packing);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/outbound-delivery.jsp");
		requestDispatcher.forward(request, response);
	}
}
