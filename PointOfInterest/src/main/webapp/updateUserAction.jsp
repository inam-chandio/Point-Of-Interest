<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String idToUpdate = request.getParameter("id");
    String name = request.getParameter("name1");
    String email = request.getParameter("email1");
    String password = request.getParameter("pass1");
    String gender = request.getParameter("gender1");
    String city = request.getParameter("city1");

    Connection con = null;
    PreparedStatement psUpdate = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");

        String updateQuery = "UPDATE register SET name=?, email=?, password=?, gender=?, city=? WHERE id=?";
        psUpdate = con.prepareStatement(updateQuery);
        psUpdate.setString(1, name);
        psUpdate.setString(2, email);
        psUpdate.setString(3, password);
        psUpdate.setString(4, gender);
        psUpdate.setString(5, city);
        psUpdate.setString(6, idToUpdate);

        psUpdate.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (psUpdate != null) psUpdate.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    response.sendRedirect("adminrecord.jsp");  // Redirect to your main page after update
%>
