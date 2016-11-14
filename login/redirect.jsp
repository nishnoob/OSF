<%@ page import ="java.sql.*" %>
<%@ page import ="java.security.MessageDigest" %>
<%
	int flag=0;

	//Connction and statement block
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentfeedback",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs= st.executeQuery("select Roll_No, Pass from student");

	if(session.getAttribute("userid") == "admin")
		flag=1;

	while(rs.next())
		if(session.getAttribute("userid") == rs.getString("Roll_No")){
			flag=2;
			break;
		}

	else if(flag==1)
		response.sendRedirect("../admin/admin.php");
	else if(flag==2)
		response.sendRedirect("../student/student.php");

	st.close();
%>