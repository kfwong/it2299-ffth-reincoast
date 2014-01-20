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
import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;

/**
 * Servlet implementation class getDeliveryServlet
 */
@WebServlet("/GetDeliveryServlet")
public class GetDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDeliveryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		
		if(!(request.getParameter("delivery_id") == "")){
			int id = Integer.parseInt(request.getParameter("delivery_id"));
			InboundDelivery inbound = inboundDao.get(id);
			
			Map<String , String> map = new HashMap<String, String>();
			map.put("id", Integer.toString(inbound.getId()));
			map.put("name", inbound.getDonorName());
			map.put("type", inbound.getDonorType());
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			map.put("deliveryDate", df.format(inbound.getDateDelivered()));
			
			Gson gson = new GsonBuilder().create();
			PrintWriter out = response.getWriter();
			String itemGson = gson.toJson(map);

			out.println(itemGson);
			
		}else{
		
			String name = request.getParameter("donor_name");
			List<InboundDelivery> inboundList = inboundDao.getAllByDonorName(name);
			ArrayList<Map<String, String>> myMap = new ArrayList<Map<String, String>>();
			
			for(int i=0; i< inboundList.size();i++){
				Map<String, String> map = new HashMap<String, String>();
				map.put("count", Integer.toString(i+1));
				map.put("deliveryid", Integer.toString(inboundList.get(i).getId()));
				map.put("deliveryname", inboundList.get(i).getDonorName());
				map.put("deliverytype", inboundList.get(i).getDonorType());
				DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
				map.put("deliveryDate2", df.format(inboundList.get(i).getDateDelivered()));
				myMap.add(map);
				
			}
			
			Gson gson = new GsonBuilder().create();
			String packageGson = gson.toJson(myMap);
			
			PrintWriter out = response.getWriter();
			out.println(packageGson);
		}
		
		
		
		
	}

}
