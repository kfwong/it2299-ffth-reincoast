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
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		InboundDelivery trans = new InboundDelivery();
		trans.setDonorName(request.getParameter("Donor"));
		trans.setDonorType(request.getParameter("Type"));
		String string = request.getParameter("deliveryDate");
		
		double total = 0;
		String[] id = request.getParameterValues("id");
		String[] quantity = request.getParameterValues("item-quantity");
		String[] price = request.getParameterValues("item-price");
		String[] expiryDate = request.getParameterValues("expiry-date");
		
		ArrayList<InboundLineItem> itemArray = new ArrayList<InboundLineItem>();
		ArrayList<Stock> myStock = new ArrayList<Stock>();
		for (int i = 0; i < id.length; i++) {
			InboundLineItem item = new InboundLineItem();
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
			item.setInboundDelivery(trans);
			item.setQuantity(Integer.parseInt(quantity[i]));
			stock.setProduct(product);
			stock.setQuantity(Integer.parseInt(quantity[i]));
			
			total = total + (Double.parseDouble(price[i]) * Integer.parseInt(quantity[i]));
			itemArray.add(item);
			myStock .add(stock);
		}
		trans.setTotalPrice(total);
		trans.setItems(itemArray);
		try {
			Date date1 = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH).parse(string);
			trans.setDateDelivered(date1);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		InboundDeliveryDao transDao = new InboundDeliveryDao();
		transDao.saveOrUpdate(trans);
		StockDao stockDao = new StockDao();
		for(int i=0; i< myStock .size();i++){
			boolean valid = stockDao.isExists(myStock .get(i).getProduct());
			if(!valid){
				System.out.println("update");
				int currentQuantity = stockDao.get(Integer.parseInt(id[i])).getQuantity();
				
				int newQuantity = currentQuantity + myStock .get(i).getQuantity();
				
				myStock .get(i).setQuantity(newQuantity);
				stockDao.updateStock(myStock.get(i));
			}else{
				System.out.println("Create new");
				stockDao.saveOrUpdate(myStock.get(i));
			}
		}
		
		PrintWriter out = response.getWriter();
		out.print("ok");
	}

}
