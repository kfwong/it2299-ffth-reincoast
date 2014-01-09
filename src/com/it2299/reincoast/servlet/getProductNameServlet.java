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
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Product;

/**
 * Servlet implementation class getProductNameServlet
 */
@WebServlet("/getProductNameServlet")
public class getProductNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getProductNameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			ProductDao productDao = new ProductDao();
			ArrayList<Map<String, String>> myMap = new ArrayList<Map<String, String>>();
			List<Product> productList = productDao.getAll();
			
			for(int i=0; i< productList.size(); i++){
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", Integer.toString(productList.get(i).getId()));
				map.put("name", productList.get(i).getName());
				myMap.add(map);
			}
			Gson gson = new GsonBuilder().create();
			String packageGson = gson.toJson(myMap);
			
			PrintWriter out = response.getWriter();
			out.println(packageGson);
	}

}
