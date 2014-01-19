package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.envers.RevisionType;

import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Audit;

/**
 * Servlet implementation class AuditProductLog
 */
@WebServlet("/AuditProductLog")
public class AuditProductLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuditProductLog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao productDao = new ProductDao();
		
		request.setAttribute("audits", productDao.getAudits());
		request.setAttribute("total", productDao.getAuditsCount());
		request.setAttribute("totalInsert", productDao.getAuditsCount(RevisionType.ADD));
		request.setAttribute("totalUpdate", productDao.getAuditsCount(RevisionType.MOD));
		request.setAttribute("totalDelete", productDao.getAuditsCount(RevisionType.DEL));
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/audit-product-log.jsp");
		requestDispatcher.forward(request, response);
	}

}
