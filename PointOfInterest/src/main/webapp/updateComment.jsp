<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
</head>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        form {
            width: 300px;
            margin: 20px auto;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
<body>

<%
    String idToUpdate = request.getParameter("id");
    Connection con = null;
    PreparedStatement psSelect = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");

        String selectQuery = "SELECT * FROM likepoints WHERE id = ?";
        psSelect = con.prepareStatement(selectQuery);
        psSelect.setString(1, idToUpdate);

        rs = psSelect.executeQuery();

        if (rs.next()) {
%>
           <form action="updateCommentAction.jsp" method="post">
   				 Country: <%= rs.getString("country") %> <br/><br/>
    			 Likes: <%= rs.getString("likes") %> <br/><br/>
   				 Comment: <input type="text" name="comment1" value="<%= rs.getString("comment") %>" required /> <br/><br/>
    			<input type="hidden" name="id" value="<%= rs.getString("id") %>"/>
    			<input type="submit" value="Update"/>
		   </form>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (psSelect != null) psSelect.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
