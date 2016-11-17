<%@ page import ="java.sql.*" %>
<%@ include file="adminredirect.jsp" %>
<%
	String sub = request.getParameter("subject");
	if("POST".equalsIgnoreCase(request.getMethod())){
		if(sub.isEmpty())
			out.println("<script> alert('Enter a subject.'); </script>");
		else{
			st = con.createStatement();
			int chk= st.executeUpdate("INSERT INTO Subject VALUES (NULL,'"+sub+"'");

			if (chk>0)
				out.println("<script> alert('Subject Added succesfully!'); </script>");
			else
				out.println("<script> alert('Error!'); </script>");
		}
	}
%>
<!DOCTYPE html>
	<head>
		<title>Add Subject - Admin</title>
		<link rel="stylesheet" type="text/css" href="addsub.css">
	</head>
	<body>
		<header>
			<img src ="../images/tellus-logo.png"/>
			<span>
				<a href="../logout.jsp">Logout</a>
			</span>
		</header>
		<article>
			<h1>Add a Subject:</h1>
			<form action=addsub.jsp method=post>
				<div class=input>
					<input type=text name=subject placeholder="Subject Name" required>
					<button type=submit>Append</button>
				</div>
				<div class=output>
					<%
						st = con.createStatement();
						rs= st.executeQuery("Select * from Subject order by Sub_No asc");

						out.println("<table class=slist>");
						out.println("<tr>");
						out.println("<th>Subject ID</td>");
						out.println("<th>Subject Name</td>");
						out.println("</tr>");

						if(rs.next())
							while(rs.next()){
								out.println("<tr>");
								out.println("<td>" + rs.getInt("Sub_No") + "</td>");
								out.println("<td>" + rs.getString("Sub_Name") + "</td>");
								out.println("</tr>");
						}

						out.println("</table>");

						st.close();
					%>
				</div>
			</form>
		</article>
	</body>
</html>