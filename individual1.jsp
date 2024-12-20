<%@page import="java.sql.*"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8" %>--%>
<%
String s1 = request.getParameter("u1");
String s2 = request.getParameter("u2");
String s3 = request.getParameter("u3");

try {
    // Load MySQL JDBC Driver
    out.println(System.getProperty("java.class.path"));

    Class.forName("com.mysql.cj.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/csv_import", "root", "root");
            System.out.println("Connected");
    // Establish connection
    //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306///csv_import", "root", "root");
    out.println("Connected to the database successfully!");

    // Query to insert values
    String q = "select Enrollment, Semester, Branch  from final ";
    PreparedStatement ps = con.prepareStatement(q);
    ps.setString(1, s1);
    ps.setString(2, s2);
    ps.setString(3, s3);

    // Execute the update
    int rowsAffected = ps.executeUpdate();
    out.println(rowsAffected + " record(s) inserted successfully!");

    // Redirect to another page
    response.sendRedirect("indidisplay.jsp");

    con.close();
} catch (ClassNotFoundException e) {
    out.println("MySQL Driver not found: " + e.getMessage());
} catch (SQLException e) {
    out.println("SQL Exception: " + e.getMessage());
} catch (Exception e) {
    out.println("Exception: " + e.getMessage());
}
%>
