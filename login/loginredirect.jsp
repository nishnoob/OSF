<%@ page import ="java.sql.*" %>
<%
	//Connction and statement block
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentfeedback",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs= st.executeQuery("select Roll_No, Pass from student");

    //Check if user is the admin
	if(session.getAttribute("userid") == "admin")
		response.sendRedirect("../admin/admin.jsp");
	//Check if the user is student
	while(rs.next())
		if(session.getAttribute("userid").equals(rs.getString("Roll_No"))){
			response.sendRedirect("../student/student.jsp");
			break;
		}

	st.close();
%>