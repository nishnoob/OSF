<%@ page import ="java.sql.*" %>
<%
	int flag = 0;
	//Connction and statement block
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentfeedback",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs= st.executeQuery("select Roll_No, Pass from student");

    //Check if user is the admin
	if(session.getAttribute("userid").equals("admin"))
		flag=1;
	//Check if the user is student
	while(rs.next())
		if(session.getAttribute("userid").equals(rs.getString("Roll_No"))){
			flag=2;
			break;
		}

	if(flag==0)
		response.sendRedirect("../login/index.jsp");
	else if(flag==2)
		response.sendRedirect("../student/index.jsp");

	st.close();
%>