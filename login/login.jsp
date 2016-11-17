<%@ page import ="java.sql.*" %>
<%@ page import ="java.security.MessageDigest" %>
<%@ include file="loginredirect.jsp" %>
<%
    int flag=0;
    String userid = request.getParameter("user");    
    String pwd = request.getParameter("pass");
    session.setAttribute("userid",userid);
    
    //MD5 Hashing
    MessageDigest md = MessageDigest.getInstance("MD5");
    md.update(pwd.getBytes());
    byte[] digest = md.digest();
    StringBuffer sb = new StringBuffer();
    for (byte b : digest) {
        sb.append(String.format("%02x", b & 0xff));
    }
    //Saving the md5 hash value
    session.setAttribute("pwd",sb.toString());
    //Admin login check
    if(session.getAttribute("userid").equals("admin")){
        response.sendRedirect("../admin/admin.jsp");
        flag = 2;
    }

    //Connction and statement block
    
    st = con.createStatement();
    rs= st.executeQuery("select Roll_No, Pass from student");

    //Student login check
    while(rs.next()){
        out.println(rs.getString("Roll_No")+rs.getString("Pass"));
        if(session.getAttribute("userid").equals(rs.getString("Roll_No")) && session.getAttribute("pwd").equals(rs.getString("Pass"))){
            response.sendRedirect("../student/student.jsp");
            flag=1;
        }
    }

    //Invalid ID
    if(flag!=1 && flag!=2){
       out.println("<script type=\"text/javascript\">");
       out.println("alert('User or password incorrect!');");
       out.println("</script>");
       out.println("Invalid password <a href='index.jsp'>try again</a>");
    }

    st.close();
%>