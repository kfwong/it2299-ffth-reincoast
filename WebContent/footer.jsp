<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="footer">
	<p>An NYP semetral project for the awesome <a href="http://www.foodheart.org/">Food from the Heart</a>. Designed and built with all the love in the world by <a href="mailto:124465r@mymail.nyp.edu.sg">Kang Fei</a>, Fuh Chang, Zi Min & Xin Shen.</p>
	<p>
		Code licensed under <a href="http://opensource.org/licenses/MIT">MIT License</a>.
	</p>
	<p>Fork our project at <i class="fa fa-github"></i>&nbsp;Github</p>
</div>

<script src="js/bootstrap.js"></script>

<!-- 
<script src="js/tablesorter/jquery.tablesorter.js"></script>
<script src="js/tablesorter/tables.js"></script>
-->

<%
String[] js = request.getParameterValues("js");
for (String jss : js) {
%>
<script src="<%=jss%>"></script>
<%
}
%>
</body>
</html>