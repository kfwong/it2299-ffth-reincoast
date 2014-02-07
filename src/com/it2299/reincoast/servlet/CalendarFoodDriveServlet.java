package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
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
		String action = request.getParameter("action");
		
		if(action!= null){
			if(action.equals("getCalendar")){
				ArrayList<CalendarFoodDrive> foodDriveArray;
				
				CalendarFoodDriveDao dao = new CalendarFoodDriveDao();
				foodDriveArray = (ArrayList<CalendarFoodDrive>) dao.getAll();
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String json = gson.toJson(foodDriveArray);
				
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.write(json);
			}
			if(action.equals("view")){
				int id = Integer.parseInt(request.getParameter("id"));
				
				CalendarFoodDrive fd = new CalendarFoodDrive();
				
				CalendarFoodDriveDao dao = new CalendarFoodDriveDao();
				fd = dao.get(id);
				
				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
				String json = gson.toJson(fd);
				
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.write(json);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		
		if(action != null){
		
			if(action.equals("create")){
				String title = request.getParameter("title");
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				String allDay = request.getParameter("allDay");
				
				CalendarFoodDrive fd = new CalendarFoodDrive();
				fd.setTitle(title);
				fd.setStart(start);
				fd.setEnd(end);
				fd.setAllDay(allDay);
				
				CalendarFoodDriveDao dao = new CalendarFoodDriveDao();
				dao.saveOrUpdate(fd);
			}
			if(action.equals("edit")){
				int id = Integer.parseInt(request.getParameter("id"));
				
				CalendarFoodDrive fd = new CalendarFoodDrive();
				
				CalendarFoodDriveDao dao = new CalendarFoodDriveDao();
				fd = dao.get(id);
				
				Gson gson = new Gson();
				String json = gson.toJson(fd);
				
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.write(json);
			}
			if(action.equals("delete")){
				int id  = Integer.parseInt(request.getParameter("id"));
				CalendarFoodDrive fd = new CalendarFoodDrive();
				fd.setId(id);
				
				CalendarFoodDriveDao dao = new CalendarFoodDriveDao();
				dao.delete(fd);
			}
		}
		
		response.sendRedirect("schedule-fooddrive.jsp");
	}

}
