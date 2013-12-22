package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.it2299.ffth.reincoast.dao.PackingDao;
import com.it2299.ffth.reincoast.dao.PackingLineItemDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Packing;
import com.it2299.ffth.reincoast.dto.PackingLineItem;
import com.it2299.ffth.reincoast.dto.Product;

/**
 * Servlet implementation class getPackageListItem
 */
@WebServlet("/GetPackageListItem")
public class GetPackageListItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPackageListItem() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PackingLineItemDao packingLineItemDao = new PackingLineItemDao();
		ArrayList<PackingLineItem>itemList = (ArrayList<PackingLineItem>) packingLineItemDao.getAll(Integer.parseInt(request.getParameter("packID")));
		
		ProductDao productID = new ProductDao();
		ArrayList<Map<String, String>> myMap = new ArrayList<Map<String, String>>();
		
		for(int i=0; i< itemList.size(); i++){
			Map<String, String> map = new HashMap<String, String>();
			Product product = productID.get(itemList.get(i).getProduct().getId());
			map.put("name", product.getName());
			map.put("code", product.getCode());
			map.put("id", Integer.toString(product.getId()));
			map.put("price", Double.toString(product.getPrice()));
			myMap.add(map);
			}
		
		
		
		Gson gson = new GsonBuilder().create();
		String packageGson = gson.toJson(myMap);
		
		PrintWriter out = response.getWriter();
		out.println(packageGson);
		
	}

}
