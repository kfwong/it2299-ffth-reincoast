<%@ page import="java.io.*,
            java.net.*,java.util.regex.*" contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer sbf = new StringBuffer();
	//Access the page
	try {
		URL url = new URL("http://www.fairprice.com.sg/webapp/wcs/stores/servlet/ProductDisplay?catalogId=10051&storeId=90001&productId=558589&langId=-1&categoryId=58601&parent_category_rn=58601&top_category=10060");
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
		String inputLine;
		while ((inputLine = in.readLine()) != null)
			sbf.append(inputLine);
		in.close();
	} catch (MalformedURLException e) {
	} catch (IOException e) {
	}

	Pattern p = Pattern.compile("<span class=\"p_detail_name\">(.*?)</span>");
	Matcher m = p.matcher(sbf);

	if (m.find()) {
		out.println(m.group(1));
	}
%>
