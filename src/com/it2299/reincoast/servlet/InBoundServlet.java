package com.it2299.reincoast.servlet;

import java.io.IOException;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.InboundTransDao;
import com.it2299.ffth.reincoast.dto.InboundItem;
import com.it2299.ffth.reincoast.dto.InboundTran;


/**
 * Servlet implementation class InBoundServlet
 */
@WebServlet("/InBoundServlet")
public class InBoundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InBoundServlet() {
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
		InboundTran trans = new InboundTran();
		trans.setDonor(request.getParameter("Donor"));
		trans.setDonorType(request.getParameter("Type"));
		Date date = new Date();
		trans.setDate(date);
		trans.setReceiptno(Integer.parseInt(request.getParameter("ReceiptNO")));
		String [] id = request.getParameterValues("id");
		String [] code = request.getParameterValues("item-code");
		String [] name = request.getParameterValues("item-name");
		String [] quantity = request.getParameterValues("item-quantity");
		String [] price = request.getParameterValues("item-price");
		String [] unit = request.getParameterValues("item-measure");
		ArrayList<InboundItem> itemArray = new ArrayList<InboundItem>();
		for(int i=0; i< id.length;i++){
			InboundItem item = new InboundItem();
			item.setId(Integer.parseInt(id[i]));
			item.setItemid(Integer.parseInt(code[i]));
			itemArray.add(item);
		}
		
		trans.setInboundItems(itemArray);
		InboundTransDao transDao = new InboundTransDao();
		transDao.openSession();
		transDao.getSession().beginTransaction();
		transDao.saveOrUpdate(trans);
		transDao.getSession().getTransaction().commit();
		transDao.closeSession();
		
		PrintWriter out = response.getWriter();
		out.print("ok");
	}

}
