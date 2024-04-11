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

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="radio"] {
            margin-right: 5px;
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

        String selectQuery = "SELECT * FROM register WHERE id = ?";
        psSelect = con.prepareStatement(selectQuery);
        psSelect.setString(1, idToUpdate);

        rs = psSelect.executeQuery();

        if (rs.next()) {
%>
            <form action="updateUserAction.jsp" method="post">
                Name: <input type="text" name="name1" value="<%= rs.getString("name") %>" required /> <br/><br/>
                Email: <input type="text" name="email1" value="<%= rs.getString("email") %>" required /> <br/><br/>
                Password: <input type="password" name="pass1" value="<%= rs.getString("password") %>" required /> <br/><br/>
                Gender: <input type="radio" name="gender1" value="Male" <%= rs.getString("gender").equals("Male") ? "checked" : "" %> required/>Male
                        <input type="radio" name="gender1" value="Female" <%= rs.getString("gender").equals("Female") ? "checked" : "" %> /> Female<br/><br/>
                City: <select name="city1" required>
                        <option <%= rs.getString("city").equals("Larkana") ? "selected" : "" %>>Larkana</option>
                        <option <%= rs.getString("city").equals("Sukkur") ? "selected" : "" %>>Sukkur</option>
                        <option <%= rs.getString("city").equals("Nawabshah") ? "selected" : "" %>>Nawabshah</option>
                    </select> <br/><br/>
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
