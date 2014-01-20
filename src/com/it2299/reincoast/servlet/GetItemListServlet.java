package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.ItemDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;

/**
 * Servlet implementation class getItemListServlet
 */
@WebServlet("/GetItemListServlet")
public class GetItemListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetItemListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		InboundDelivery inbound = new InboundDelivery();
		inbound.setId(id);
		ItemDao itemDao = new ItemDao();
		List<InboundLineItem> itemList = itemDao.getList(inbound);
		for(int i=0 ; i<itemList.size(); i++){
			System.out.println(itemList.get(i).getId());
		}
		
		request.setAttribute("itemList", itemList);
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/item-list.jsp");
		requestDispatcher.forward(request, response);
	}

	
}
