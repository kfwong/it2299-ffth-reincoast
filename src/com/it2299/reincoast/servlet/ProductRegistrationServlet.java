package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.dto.ProductMeta;

/**
 * Servlet implementation class ProductRegistrationServlet
 */
@WebServlet("/ProductRegistrationServlet")
public class ProductRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductRegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product product = new Product();
		product.setCategory(request.getParameter("p_category"));
		product.setCode(request.getParameter("p_code"));
		product.setDateRegistered(new Date());
		product.setDescription(request.getParameter("p_description"));
		product.setName(request.getParameter("p_name"));
		product.setPrice(Double.parseDouble(request.getParameter("p_price")));
		product.setRegisteredBy("Foo Bar");
		product.setSku(request.getParameter("p_sku"));
		product.setStatus(request.getParameter("p_status"));
		product.setUnitOfMeasure(request.getParameter("p_unit_of_measure"));
		product.setWeight(Double.parseDouble(request.getParameter("p_weight")));
		
		switch(request.getParameter("p_action")){
		case "Submit":
			// do nothing
			break;
		case "Update":
			product.setId(Integer.parseInt(request.getParameter("p_id")));
			break;
		}

		String[] metaKeys = request.getParameterValues("p_meta_key");
		String[] metaValues = request.getParameterValues("p_meta_value");
		ArrayList<ProductMeta> productMetas = new ArrayList<ProductMeta>();

		for (int i = 0; i < metaKeys.length; i++) {
			ProductMeta productMeta = new ProductMeta();
			productMeta.setMetaKey(metaKeys[i]);
			productMeta.setMetaValue(metaValues[i]);

			productMetas.add(productMeta);
		}
		product.setProductMetas(productMetas);

		ProductDao productDao = new ProductDao();
		productDao.openSession();
		productDao.getSession().beginTransaction();
		productDao.saveOrUpdate(product);
		productDao.getSession().getTransaction().commit();
		productDao.closeSession();

		PrintWriter out = response.getWriter();
		out.print("ok");

	}

}
