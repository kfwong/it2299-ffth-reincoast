package com.it2299.reincoast.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class ProductImportServlet
 */
@WebServlet("/ProductImportServlet")
public class ProductImportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductImportServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String import_url = request.getParameter("p_import_url");
		StringBuffer sbf = new StringBuffer();
		// Access the page
		try {
			URL url = new URL(import_url);
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			String inputLine;
			while ((inputLine = in.readLine()) != null)
				sbf.append(inputLine);
			in.close();
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		}

		Pattern p1 = Pattern.compile("<span class=\"p_detail_name\">(.*?)</span>");
		Pattern p2 = Pattern.compile("<td class=\"p_detail_attr_cell\">(.*?)</td>");
		Pattern p3 = Pattern.compile("<span class=\"fp_list_price\">(.*?)</span>");

		Matcher m1 = p1.matcher(sbf);
		Matcher m2 = p2.matcher(sbf);
		Matcher m3 = p3.matcher(sbf);

		String name = m1.find() ? m1.group(1).trim() : "";
		String weight = m2.find() ? m2.group(1).trim().replaceAll("\t", "") : "";
		String price = m3.find() ? m3.group(1).trim() : "";

		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("name", name);
		dataMap.put("weight", weight);
		dataMap.put("price", price);

		Gson gson = new Gson();
		String data = gson.toJson(dataMap);

		PrintWriter out = response.getWriter();
		out.println(data);
	}

}
