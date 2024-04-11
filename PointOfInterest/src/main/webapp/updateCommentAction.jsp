<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String idToUpdate = request.getParameter("id");
    String comment = request.getParameter("comment1");
   

    Connection con = null;
    PreparedStatement psUpdate = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");

        String updateQuery = "UPDATE likepoints SET comment=? WHERE id=?";
        psUpdate = con.prepareStatement(updateQuery);
        psUpdate.setString(1, comment);
        psUpdate.setString(2, idToUpdate);
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
