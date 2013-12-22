package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.it2299.ffth.reincoast.dao.PackingListDao;
import com.it2299.ffth.reincoast.dto.PackageList;
import com.it2299.ffth.reincoast.dto.PackageListItem;
import com.it2299.ffth.reincoast.dto.Product;

@WebServlet("/CreatePackageListServlet")
public class CreatePackageListServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CreatePackageListServlet(){
		super();
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		PackageList pList = new PackageList();
		pList.setPackageName(request.getParameter("packageName"));
		
		ArrayList<PackageListItem> pListArray = new ArrayList<PackageListItem>();
		
		String[] id = request.getParameterValues("id");
		String[] quantity = request.getParameterValues("item-quantity");
		
		for(int i=0; i< id.length;i++){
			PackageListItem pListItem = new PackageListItem();
			pListItem.setPackingList(pList);
			Product product = new Product();
			product.setId(Integer.parseInt(id[i]));
			pListItem.setProduct(product);
			pListItem.setQuantity(Integer.parseInt(quantity[i]));
			pListArray.add(pListItem);
		}
		pList.setPackItem(pListArray);
		
		PackingListDao pListDao = new PackingListDao();
		pListDao.saveOrUpdate(pList);
		
		PrintWriter out = response.getWriter();
		out.print("ok");
	}
}
