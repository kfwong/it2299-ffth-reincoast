package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.DateUtils;

import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.ItemDao;
import com.it2299.ffth.reincoast.dao.ProductBatchDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.ProductBatch;
import com.it2299.ffth.reincoast.dto.Stock;

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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		

		
		String[] id = request.getParameterValues("item-code");
		String[] quantity = request.getParameterValues("item-quantity");
		String[] price = request.getParameterValues("item-price");
		String[] expiryDate = request.getParameterValues("expiry-date");
		
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		InboundDelivery inbound = new InboundDelivery();
		Date date;
		try {
			date = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH).parse(request.getParameter("deliveryDate"));
			
			inbound.setDonorName(request.getParameter("Donor"));
			inbound.setDonorType(request.getParameter("Type"));
			inbound.setDateDelivered(date);
			double totalPrice = 0;
			for(int i=0 ;i < price.length; i++){
				totalPrice = totalPrice + Double.parseDouble(price[i]);
			}
			inbound.setTotalPrice(totalPrice);
			inboundDao.saveOrUpdate(inbound);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i=0; i< id.length; i++){
			ProductDao productDao = new ProductDao();
			
			
			Product product = new Product();
			product.setId(Integer.parseInt(id[i]));
			try {
				Date d = DateUtils.parseDate(expiryDate[i], "MM/dd/yyyy");
				productDao.increaseQuantity(product.getId(), Integer.parseInt(quantity[i]), d);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			ItemDao itemDao = new ItemDao();
			InboundLineItem inboundItem = new InboundLineItem();
			inboundItem.setProduct(product);
			inboundItem.setQuantity(Integer.parseInt(quantity[i]));
			inboundItem.setInboundDelivery(inbound);
			Date date1 = null;
			try {
				date1 = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH).parse(expiryDate[i]);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			inboundItem.setExpiryDate(date1);
			itemDao.saveOrUpdate(inboundItem);
		}
		
		
		
		

		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("success.jsp");
		requestDispatcher.forward(request, response);
	}

}
