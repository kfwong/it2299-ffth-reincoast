package com.it2299.reincoast.servlet;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

import com.it2299.ffth.reincoast.dao.StockDao;
import com.it2299.ffth.reincoast.dto.Stock;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PieChartServlet
 */
@WebServlet("/PieChartServlet")
public class PieChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PieChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doTestPieChart(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	protected void doTestPieChart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		StockDao stockDao = new StockDao();
		List<Stock> stockList = stockDao.getAll();
		OutputStream out = response.getOutputStream();
		
		try{
			DefaultPieDataset dataset =  new DefaultPieDataset();
			for(int i=0; i< stockList.size(); i++){
			dataset.setValue(stockList.get(i).getProduct().getName(), stockList.get(i).getQuantity());
			}
			
			JFreeChart chart = ChartFactory.createPieChart("Stock by Type", dataset, true, false, false);
					chart.setBackgroundPaint(Color.white); 
					response.setContentType("image/png");
					ChartUtilities.writeChartAsPNG(out, chart, 400, 300);
		}
		catch(Exception e){
			System.out.println(e.toString());
		}finally{
			out.close();
		}
	}
	

}
