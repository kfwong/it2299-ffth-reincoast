package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.Item;
import com.it2299.ffth.reincoast.dto.Product;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		InboundDelivery trans = new InboundDelivery();
		trans.setDonorName(request.getParameter("Donor"));
		trans.setDonorType(request.getParameter("Type"));
		String string = request.getParameter("deliveryDate");
		try {
			Date date = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH).parse(string);
			trans.setDateDelivered(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		double total = 0;
		String[] id = request.getParameterValues("id");
		String[] code = request.getParameterValues("item-code");
		String[] name = request.getParameterValues("item-name");
		String[] quantity = request.getParameterValues("item-quantity");
		String[] price = request.getParameterValues("item-price");
		String[] expiryDate = request.getParameterValues("expiry-date");
		
		ArrayList<Item> itemArray = new ArrayList<Item>();
		for (int i = 0; i < id.length; i++) {
			Item item = new Item();
			Product product = new Product();
			Stock stock = new Stock();
			try {
				Date date1 = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH).parse(expiryDate[i]);
				item.setExpiryDate(date1);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			product.setId(Integer.parseInt(id[i]));
			
			item.setProduct(product);
			item.setQuantity(Integer.parseInt(quantity[i]));
			stock.setProduct(product);
			stock.setQuantity(Integer.parseInt(quantity[i]));
			total = total
					+ (Double.parseDouble(price[i]) * Integer
							.parseInt(quantity[i]));
			itemArray.add(item);
		}
		trans.setTotalPrice(total);
		trans.setItems(itemArray);
		InboundDeliveryDao transDao = new InboundDeliveryDao();
		transDao.saveOrUpdate(trans);
		
	
		
		PrintWriter out = response.getWriter();
		out.print("ok");
	}

}
