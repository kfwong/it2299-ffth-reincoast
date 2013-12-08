package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.it2299.ffth.reincoast.dao.InboundTransDao;
import com.it2299.ffth.reincoast.dto.InboundTran;

/**
 * Servlet implementation class GetTransHistory
 */
@WebServlet("/GetTransHistory")
public class GetTransHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTransHistory() {
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
		Gson gson = new Gson();
		
		InboundTransDao trans = new InboundTransDao();
		trans.openSession();
		List<InboundTran> inTran = trans.getAll();
		String tranGson =null;
		PrintWriter out = response.getWriter();
		
		for(int i=0;i<inTran.size();i++){
			tranGson = gson.toJson(inTran.get(i));
			out.println(tranGson);
		}
		trans.closeSession();
				
	}

}
