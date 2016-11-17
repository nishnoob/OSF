<%
	session.setAttribute("userid", "");
	session.setAttribute("pass", "");
	response.sendRedirect("login/index.jsp");
%>