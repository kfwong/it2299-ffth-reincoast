package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
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
 * Servlet implementation class SearchInboundServlet
 */
@WebServlet("/SearchInboundServlet")
public class SearchInboundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchInboundServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("hiddenID");
		String name = request.getParameter("hiddenName");
		String date1 = request.getParameter("hiddenDate1");
		String date2 = request.getParameter("hiddenDate2");
		String type = request.getParameter("hiddenType");
		
		if(!id.equals("")){
			InboundDeliveryDao inboundDao = new InboundDeliveryDao();
			InboundDelivery inbound = inboundDao.get(Integer.parseInt(id));
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", Integer.toString(inbound.getId()));
			map.put("name", inbound.getDonorName());
			map.put("type", inbound.getDonorType());
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			map.put("date", df.format(inbound.getDateDelivered()));
			Gson gson = new GsonBuilder().create();
			String result = gson.toJson(map);
			PrintWriter out = response.getWriter();
			out.println(result);
		}else if(!name.equals("")){
			
		}else if(!date1.equals("") || !date2.equals("")){
			
		}else{
			
		}
	}

}
