package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.it2299.ffth.reincoast.dao.CalendarFoodDriveDao;
import com.it2299.ffth.reincoast.dto.CalendarFoodDrive;

/**
 * Servlet implementation class CalendarFoodDriveServlet
 */
@WebServlet("/CalendarFoodDriveServlet")
public class CalendarFoodDriveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarFoodDriveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<CalendarFoodDrive> foodDriveArray = new ArrayList<CalendarFoodDrive>();
		
		CalendarFoodDrive fd1 = new CalendarFoodDrive();
		fd1.setTitle("TestTitle");
		fd1.setStart("2014-01-01");
		
		foodDriveArray.add(fd1);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.write(new Gson().toJson(foodDriveArray));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String start = request.getParameter("start");
		
		CalendarFoodDrive fd = new CalendarFoodDrive();
		fd.setTitle(title);
		fd.setStart(start);
		
		CalendarFoodDriveDao dao = new CalendarFoodDriveDao();
		dao.saveOrUpdate(fd);
	}

}
