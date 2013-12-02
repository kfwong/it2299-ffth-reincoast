package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.InboundTransDao;
import com.it2299.ffth.reincoast.dto.InboundItem;
import com.it2299.ffth.reincoast.dto.InboundTrans;

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
		InboundTrans trans = new InboundTrans();
		//InboundItem item = new InboundItem();
		trans.setDonor(request.getParameter("Donor"));
		trans.setDonorType(request.getParameter("Type"));
		System.out.println(request.getParameter("ReceiptNO"));
		trans.setReceiptNo(Integer.parseInt(request.getParameter("ReceiptNO")));
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
