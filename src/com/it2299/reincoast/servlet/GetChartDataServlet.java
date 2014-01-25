package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;

/**
 * Servlet implementation class GetChartDataServlet
 */
@WebServlet("/GetChartDataServlet")
public class GetChartDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetChartDataServlet() {
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
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		List<InboundDelivery> inboundList = inboundDao.getAll();
		ArrayList<Map<String, String>> myMap = new ArrayList<Map<String, String>>();
		for(int i=0; i< inboundList.size(); i++){
			Map<String, String> map = new HashMap<String, String>();
			map.put("donorName", inboundList.get(i).getDonorName());
			
		}
	}

}
