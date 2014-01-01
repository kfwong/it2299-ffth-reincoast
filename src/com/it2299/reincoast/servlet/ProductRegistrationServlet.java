package com.it2299.reincoast.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.io.FileUtils;

import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dao.ProductMetaDao;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao productDao = new ProductDao();

		request.setAttribute("p_category", "\"" + StringUtils.join(productDao.getCategories(), "\",\"") + "\"");

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-add-new.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product product = new Product();
		product.setCategory(StringUtils.join(request.getParameterValues("p_category"), ","));
		product.setCode(request.getParameter("p_code"));
		product.setDateRegistered(new Date());
		product.setDescription(request.getParameter("p_description"));
		product.setName(request.getParameter("p_name"));
		product.setPrice(Double.parseDouble(request.getParameter("p_price")));
		product.setRegisteredBy("Foo Bar");
		product.setStatus(request.getParameter("p_status"));
		product.setUnitOfMeasure(request.getParameter("p_unit_of_measure"));
		product.setWeight(Double.parseDouble(request.getParameter("p_weight")));
		product.setImageUrl(request.getParameter("p_image_url")); //HOT LINK TO NTUC RESOURCE, NOT GOOOD!!!!! for convenience only..

		switch (request.getParameter("p_action")) {
		case "Submit":
			// do nothing
			break;
		case "Update":
			product.setId(Integer.parseInt(request.getParameter("p_id")));

			if (!request.getParameter("p_meta_id_removals").isEmpty()) {
				String[] metaIdRemovals = request.getParameter("p_meta_id_removals").split(",");
				ProductMetaDao productMetaDao = new ProductMetaDao();
				for (String metaIdRemoval : metaIdRemovals) {
					productMetaDao.deleteById(Integer.parseInt(metaIdRemoval));
				}
			}
			break;
		}

		String[] metaIds = request.getParameterValues("p_meta_id");
		String[] metaKeys = request.getParameterValues("p_meta_key");
		String[] metaValues = request.getParameterValues("p_meta_value");

		try {
			ArrayList<ProductMeta> productMetas = new ArrayList<ProductMeta>();

			for (int i = 0; i < metaKeys.length; i++) {

				ProductMeta productMeta = new ProductMeta();
				productMeta.setMetaKey(metaKeys[i]);
				productMeta.setMetaValue(metaValues[i]);
				productMeta.setProduct(product);

				try {
					productMeta.setId(Integer.parseInt(metaIds[i]));
				} catch (Exception ex) {
					// do nothing
				}

				productMetas.add(productMeta);
			}

			product.setProductMetas(productMetas);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		ProductDao productDao = new ProductDao();
		productDao.saveOrUpdate(product);

		response.sendRedirect("ProductViewServlet?id=" + product.getId());

	}

}
