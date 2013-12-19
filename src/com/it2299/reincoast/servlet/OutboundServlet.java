package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dto.Item;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.Stock;

public class OutboundServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public OutboundServlet(){
		super();
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			OutboundDelivery outD = new OutboundDelivery();
			Date date;
			try {
				date = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH).parse(request.getParameter("deliveryDate"));
				outD.setDateDelivered(date);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			outD.setCollectionCenter(request.getParameter("cc"));
			outD.setDescription(request.getParameter("package_description"));
			String[] id = request.getParameterValues("id");
			String[] quantity = request.getParameterValues("item-quantity");
			String[] price = request.getParameterValues("item-price");
			double total = 0;
			ArrayList<Item> itemArray = new ArrayList<Item>();
			for (int i = 0; i < id.length; i++) {
				Item item = new Item();
				Product product = new Product();
				
				product.setId(Integer.parseInt(id[i]));
				
				item.setProduct(product);
				item.setQuantity(Integer.parseInt(quantity[i]));
				total = total+ (Double.parseDouble(price[i]) * Integer.parseInt(quantity[i]));
				itemArray.add(item);
			}
			outD.setTotalPrice(total);
			OutboundDeliveryDao outDao = new OutboundDeliveryDao();
			outDao.saveOrUpdate(outD);
			
			PrintWriter out = response.getWriter();
			out.print("ok");
	}
}
