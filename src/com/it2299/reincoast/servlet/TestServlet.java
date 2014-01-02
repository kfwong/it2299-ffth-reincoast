package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Audit> audits = new ArrayList<Audit>();

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
														// HibernateDaoSupport

		AuditReader reader = AuditReaderFactory.get(session);
		AuditQuery query = reader.createQuery().forEntitiesAtRevision(Product.class, Integer.parseInt(request.getParameter("revisionId")));
		query.add(AuditEntity.id().eq(Integer.parseInt(request.getParameter("entityId"))));
		query.setMaxResults(1);

		Product product = (Product) query.getSingleResult();

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", Integer.toString(product.getId()));
		map.put("name", product.getName());
		map.put("description", product.getDescription());
		map.put("unitOfMeasure", product.getUnitOfMeasure());
		map.put("price", Double.toString(product.getPrice()));
		map.put("weight", Double.toString(product.getWeight()));
		map.put("category", product.getCategory());
		map.put("dateRegistered", product.getDateRegistered().toString());
		map.put("registeredBy", product.getRegisteredBy());
		map.put("imageUrl", product.getImageUrl());

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map);

		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
