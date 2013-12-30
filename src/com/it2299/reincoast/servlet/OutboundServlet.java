package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.Stock;

@WebServlet("/OutboundServlet")
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
			String[] id = request.getParameterValues("id");
			String[] quantity = request.getParameterValues("item-quantity");
			String[] price = request.getParameterValues("item-price");
			double total = 0;
			ArrayList<OutboundLineItem> itemArray = new ArrayList<OutboundLineItem>();
			for (int i = 0; i < id.length; i++) {
				OutboundLineItem item = new OutboundLineItem();
				Product product = new Product();
				
				product.setId(Integer.parseInt(id[i]));
				
				item.setProduct(product);
				item.setOutboundDelivery(outD);
				item.setQuantity(Integer.parseInt(quantity[i]));
				total = total+ (Double.parseDouble(price[i]) * Integer.parseInt(quantity[i]));
				itemArray.add(item);
				StockDao stockDao = new StockDao();
				List<Stock> myStock = stockDao.getAll();

				if (!myStock.isEmpty()) {
				if(myStock.get(i).getProduct().getId() == product.getId()){
					Stock stock = new Stock();
						int newQuantity = myStock.get(i).getQuantity() - item.getQuantity();
						stock.setProduct(product);
						stock.setQuantity(newQuantity);
						stockDao.updateStock(stock);
					}
				}else{
					response.sendRedirect(product.getName() + "is currently out of stock");
				}
			}
			outD.setTotalPrice(total);
			outD.setCollectionCenter(request.getParameter("collectLoc"));
			outD.setItems(itemArray);
			OutboundDeliveryDao outDao = new OutboundDeliveryDao();
			outDao.saveOrUpdate(outD);
			
			PrintWriter out = response.getWriter();
			out.print("ok");
	}
}
