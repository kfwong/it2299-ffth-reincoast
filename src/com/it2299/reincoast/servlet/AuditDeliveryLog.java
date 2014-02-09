package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.InboundLineItem;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * Servlet implementation class AuditDeliveryLog
 */
@WebServlet("/AuditDeliveryLog")
public class AuditDeliveryLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuditDeliveryLog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();// this being
														// HibernateDaoSupport

		Query query = session.createSQLQuery("SELECT 'INBOUND' AS `type`, INBOUND_DELIVERY_AUD.ID as `id`, PRODUCT.NAME AS `name`, PRODUCT.CODE AS `code`, INBOUND_LINE_ITEM_AUD.QUANTITY AS `quantity`, REVTSTMP AS `date` FROM INBOUND_LINE_ITEM_AUD "
				+ "INNER JOIN PRODUCT "
				+ "ON PRODUCT.ID = INBOUND_LINE_ITEM_AUD.PRODUCT_ID "
				+ "INNER JOIN INBOUND_DELIVERY_AUD "
				+ "ON INBOUND_DELIVERY_AUD.REV = INBOUND_LINE_ITEM_AUD.REV "
				+ "INNER JOIN REVINFO "
				+ "ON REVINFO.REV = INBOUND_LINE_ITEM_AUD.REV "
				+ "UNION "
				+ "SELECT 'OUTBOUND' AS `type`, OUTBOUND_DELIVERY_AUD.ID as `id`, PRODUCT.NAME AS `name`, PRODUCT.CODE AS `code`, OUTBOUND_LINE_ITEM_AUD.QUANTITY AS `quantity`, REVTSTMP AS `date` FROM OUTBOUND_LINE_ITEM_AUD "
				+ "INNER JOIN PRODUCT "
				+ "ON PRODUCT.ID = OUTBOUND_LINE_ITEM_AUD.PRODUCT_ID "
				+ "INNER JOIN OUTBOUND_DELIVERY_AUD "
				+ "ON OUTBOUND_DELIVERY_AUD.REV = OUTBOUND_LINE_ITEM_AUD.REV "
				+ "INNER JOIN REVINFO "
				+ "ON REVINFO.REV = OUTBOUND_LINE_ITEM_AUD.REV "
				+ "ORDER BY `date` DESC");
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		
		List audits = query.list();
		
		request.setAttribute("audits", audits);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("audit-delivery-log.jsp");
		requestDispatcher.forward(request, response);

	}

}
