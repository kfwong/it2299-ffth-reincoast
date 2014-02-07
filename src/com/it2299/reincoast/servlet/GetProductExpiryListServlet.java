package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import com.it2299.ffth.reincoast.dao.ProductBatchDao;
import com.it2299.ffth.reincoast.dto.ProductBatch;

/**
 * Servlet implementation class GetProductExpiryListServlet
 */
@WebServlet("/GetProductExpiryListServlet")
public class GetProductExpiryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductExpiryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("itemCode"));
		
		ProductBatchDao productBD = new ProductBatchDao();
			List<ProductBatch> batchList = productBD.getBatch(id);
			ArrayList<Map<String, String>> myMap = new ArrayList<Map<String, String>>();
			for(int i=0; i<batchList.size(); i++){
				Map<String, String> map = new HashMap<String, String>();
				DateFormat df = new SimpleDateFormat("dd MMM yyyy");
				map.put("id", Integer.toString(batchList.get(i).getProductId()));
				map.put("ExpiryDate", df.format(batchList.get(i).getExpiryDate()));
				map.put("Quantity", Integer.toString(batchList.get(i).getQuantity()));
				myMap.add(map);
			}
			
			Gson gson = new GsonBuilder().create();
			String packageGson = gson.toJson(myMap);
			
			PrintWriter out = response.getWriter();
			out.println(packageGson);
	}

}
