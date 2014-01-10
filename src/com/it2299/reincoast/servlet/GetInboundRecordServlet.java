package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
 * Servlet implementation class GetInboundRecordServlet
 */
@WebServlet("/GetInboundRecordServlet")
public class GetInboundRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInboundRecordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		List<InboundDelivery> inboundList = inboundDao.getAll();
		ArrayList<Map<String, String>> myMap = new ArrayList<Map<String, String>>();
		
		for(int i=0; i<inboundList.size();i++){
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", Integer.toString(inboundList.get(i).getId()));
			map.put("name", inboundList.get(i).getDonorName());
			map.put("type", inboundList.get(i).getDonorType());
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			map.put("date", df.format(inboundList.get(i).getDateDelivered()));
			myMap.add(map);
		}
		
		Gson gson = new GsonBuilder().create();
		String packageGson = gson.toJson(myMap);
		
		PrintWriter out = response.getWriter();
		out.println(packageGson);
	}

}
