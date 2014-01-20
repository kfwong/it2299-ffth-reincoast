package com.it2299.reincoast.servlet;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.Stock;

/**
 * Servlet implementation class XYChartServlet
 */
@WebServlet("/XYChartServlet")
public class XYChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XYChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StockDao stockDao = new StockDao();
		List<Stock> stockList = stockDao.getAll();
		OutputStream out = response.getOutputStream();
		XYSeries series = new XYSeries("Average Stock");
		for(int i=0; i< stockList.size(); i++){
			series.add(i+1, stockList.get(i).getQuantity());
		}
		XYDataset xyDataset = new XYSeriesCollection(series);
		JFreeChart chart = ChartFactory.createXYAreaChart("my table", "x", "y", xyDataset);
		chart.setBackgroundPaint(Color.white);
		response.setContentType("image/png");
		ChartUtilities.writeChartAsPNG(out, chart, 900, 600);
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
