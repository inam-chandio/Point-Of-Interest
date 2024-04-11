<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 20px;
        }

        h2, h3 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: #fff;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
<body>
<h2> Welcome : ${session_name} </h2>

<% 
    ResultSet rsPoints = null;
    ResultSet rsLikes = null;
    Connection con = null;
    PreparedStatement psPoints = null;
    PreparedStatement psLikes = null;
    String queryPoints = "SELECT * FROM register";
    String queryLikes = "SELECT * FROM likepoints";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");
        
        // Retrieve data from PointOfInterest table
        psPoints = con.prepareStatement(queryPoints);
        rsPoints = psPoints.executeQuery();
        
        // Retrieve data from likepoints table
        psLikes = con.prepareStatement(queryLikes);
        rsLikes = psLikes.executeQuery();
    %>

    <h3>PointOfInterest Table</h3>
    <table border="1">
        <tr>
        	<th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Gender</th>
            <th>City</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
        <% while (rsPoints.next()) { %>
            <tr>
            	<td><%= rsPoints.getString("id") %></td>
                <td><%= rsPoints.getString("name") %></td>
                <td><%= rsPoints.getString("email") %></td>
                <td><%= rsPoints.getString("password") %></td>
                <td><%= rsPoints.getString("gender") %></td>
                <td><%= rsPoints.getString("city") %></td>
                <td><a href="deleteUser.jsp?id=<%= rsPoints.getInt("id") %>">Delete</a></td>
                <td><a href="updateUser.jsp?id=<%= rsPoints.getInt("id") %>">Update</a></td>
              
            </tr>
        <% } %>
    </table>

    <h3>LiKED PointOf Interset Table</h3>
    <table border="1">
        <tr>
        	<th>ID</th>
            <th>Country</th>
            <th>Likes</th>
            <th>Comment</th>
            <th>Delete</th>
            <th>Update</th>
        </tr>
        <% while (rsLikes.next()) { %>
            <tr>
            	<td><%= rsLikes.getString("id") %></td>
                <td><%= rsLikes.getString("country") %></td>
                <td><%= rsLikes.getInt("likes") %></td>
                <td><%= rsLikes.getString("comment") %></td>
                <td><a href="deleteComment.jsp?id=<%= rsLikes.getInt("id") %>">Delete</a></td>
                <td><a href="updateComment.jsp?id=<%= rsLikes.getInt("id") %>">Update</a></td>
            </tr>
        <% } %>
    </table>

    <%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rsPoints != null) rsPoints.close();
            if (psPoints != null) psPoints.close();
            if (rsLikes != null) rsLikes.close();
            if (psLikes != null) psLikes.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>





</body>
</html>