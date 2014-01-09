package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.ItemDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;

/**
 * Servlet implementation class getDeliveryItemServlet
 */
@WebServlet("/getDeliveryItemServlet")
public class getDeliveryItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getDeliveryItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("deliveryItem"));
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		InboundDelivery inbound = inboundDao.get(id);
		ProductDao productID = new ProductDao();
		ItemDao itemDao = new ItemDao();
		List<InboundLineItem> itemList = itemDao.getList(inbound);
		ArrayList<Map<String, String>> myMap = new ArrayList<Map<String, String>>();
		
		for(int i=0; i< itemList.size();i++){
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
