package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.PackingListDao;
import com.it2299.ffth.reincoast.dao.PackingListItemDao;
import com.it2299.ffth.reincoast.dto.PackageList;
import com.it2299.ffth.reincoast.dto.Product;

/**
 * Servlet implementation class getPackageListItem
 */
@WebServlet("/getPackageListItem")
public class GetPackageListItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPackageListItem() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pName = Integer.parseInt(request.getParameter("pName"));
		
		PackingListDao pListDao = new PackingListDao();
		PackageList pList = pListDao.get(pName);
		
		PackingListItemDao pItemDao = new PackingListItemDao();
		pItemDao.getAll();
		ArrayList<Product> packageProduct = new ArrayList<Product>();
		for(int i=0; i<; i++){
			
		}
		
		
	}

}
