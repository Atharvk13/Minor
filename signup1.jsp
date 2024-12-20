<%@page import="java.sql.*"%>
<%
String s1=request.getParameter("u1");
String s2=request.getParameter("u2");
String s3=request.getParameter("u3");
String s4=request.getParameter("u4");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/minor?useSSL=false","root","root");

    String q="INSERT INTO signup(Username, Password, Email, Branch) VALUES (?, ?, ?, ?)";
    PreparedStatement ps = con.prepareStatement(q);
    ps.setString(1, s1);
    ps.setString(2, s2);
    ps.setString(3, s3);
    ps.setString(4, s4);

    ps.executeUpdate();

    response.sendRedirect("login.jsp");
    con.close();
} catch(Exception e1) {            
    out.println(e1);
}
%>