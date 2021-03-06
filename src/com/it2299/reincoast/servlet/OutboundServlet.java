package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.it2299.ffth.reincoast.dao.ItemDao;
import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.ProductBatchDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.ProductBatch;
import com.it2299.ffth.reincoast.dto.Stock;

@WebServlet("/OutboundServlet")
public class OutboundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OutboundServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] id = request.getParameterValues("item-code");
		String[] quantity = request.getParameterValues("item-quantity");
		String[] ExpiryDate = request.getParameterValues("ExpiryDate");
		ItemDao itemDao = new ItemDao();
		ProductDao productDao = new ProductDao();
		for (int i = 0; i < id.length; i++) {
			Date d = null;
			try {
				d = DateUtils.parseDate(ExpiryDate[i], "dd MMM yyyy");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			productDao.decreaseQuantity(Integer.parseInt(id[i]), Integer.parseInt(quantity[i]), d);

			OutboundDelivery outbound = new OutboundDelivery();
			OutboundDeliveryDao outDao = new OutboundDeliveryDao();
			outbound.setCollectionCenter(request.getParameter("collectLoc"));

			Date date;
			try {
				date = new SimpleDateFormat("mm/dd/yyyy", Locale.ENGLISH).parse(request.getParameter("deliveryDate"));
				outbound.setDateDelivered(date);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			outDao.saveOrUpdate(outbound);

			Product product = productDao.get(Integer.parseInt(id[i]));
			OutboundLineItem outboundItem = new OutboundLineItem();
			outboundItem.setProduct(product);
			outboundItem.setExpriyDate(d);
			outboundItem.setOutboundDelivery(outbound);
			outboundItem.setQuantity(Integer.parseInt(quantity[i]));
			itemDao.saveOrUpdateOutbound(outboundItem);

		}

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/GetOutboundDeliveryServlet?page=1");
		requestDispatcher.forward(request, response);

	}
}
