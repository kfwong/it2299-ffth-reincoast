package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.Stock;

/**
 * Servlet implementation class GetStockServlet
 */
@WebServlet("/GetStockServlet")
public class GetStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetStockServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		StockDao stockDao = new StockDao();
		List<Stock> stockList = stockDao.getAll();
		request.setAttribute("stockList", stockList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/stock.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		StockDao stockDao = new StockDao();
		List<Stock> stockList = stockDao.getAll();
		request.setAttribute("stockList", stockList);
		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("/stock.jsp");
		requestDispatcher.forward(request, response);
	}

}
