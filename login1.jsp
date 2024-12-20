<%@page import="java.sql.*"%>
<%
    String username = request.getParameter("u1");
    String password = request.getParameter("u2");

    boolean isValid = true;
    StringBuilder errorMessage = new StringBuilder();

    
    if (username.length() < 3) {
        isValid = false;
        errorMessage.append("Username must be at least 3 characters long.\\n");
    }

    String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
    if (!password.matches(passwordPattern)) {
        isValid = false;
        errorMessage.append("Password must be at least 8 characters long and include at least one lowercase letter, one uppercase letter, one digit, and one special character.\\n");
    }

    if (isValid) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/minor?useSSL=false", "root", "root");
            String query = "SELECT * FROM signup WHERE username = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                
                session.setAttribute("username", username);
                con.close();
            } else {
                errorMessage.append("Invalid username or password.");
                response.sendRedirect("login.jsp?error=" + errorMessage.toString());
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        response.sendRedirect("login.jsp?error=" + errorMessage.toString());
    }
%>
