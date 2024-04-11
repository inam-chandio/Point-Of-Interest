<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Display Points</title>
   </head>
<body>
    <h2>Welcome: ${session_name}</h2>

    <div class="search-dialog">
        <!-- Search by Country -->
        <input type="text" id="countrySearch" class="search-input" placeholder="Search by Country" />
        <button class="search-button" onclick="searchByCountry()">Search</button>

        <!-- Search by State -->
        <input type="text" id="stateSearch" class="search-input" placeholder="Search by State" />
        <button class="search-button" onclick="searchByState()">Search</button>
    </div>
 <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e0e0e0;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: #fff;
        }

        h1 {
            margin-top: 30px;
            color: #333;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
            margin-top: 20px;
        }

        select, input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            outline: none;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            padding: 10px;
            font-size: 16px;
        }

        .search-dialog {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            flex-direction: row;
        }

        .search-input {
            margin-right: 10px;
            padding: 5px;
        }

        .search-button {
            padding: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        // JavaScript functions for search
        function searchByCountry() {
            var country = document.getElementById("countrySearch").value;
            window.location.href = "profile.jsp?country=" + country;
        }

        function searchByState() {
            var state = document.getElementById("stateSearch").value;
            window.location.href = "profile.jsp?state=" + state;
        }
    </script>

    <% 
    ResultSet rsPoints = null;
    ResultSet rsLikes = null;
    Connection con = null;
    PreparedStatement psPoints = null;
    PreparedStatement psLikes = null;
    String queryPoints = "SELECT * FROM PointOfInterest";
    String queryLikes = "SELECT * FROM likepoints";

    // Retrieve search parameters
    String countryFilter = request.getParameter("country");
    String stateFilter = request.getParameter("state");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");
        
        // Modify query based on search parameters
        if (countryFilter != null && !countryFilter.isEmpty()) {
            queryPoints += " WHERE country = '" + countryFilter + "'";
        } else if (stateFilter != null && !stateFilter.isEmpty()) {
            queryPoints += " WHERE state = '" + stateFilter + "'";
        }

        // Retrieve data from PointOfInterest table
        psPoints = con.prepareStatement(queryPoints);
        rsPoints = psPoints.executeQuery();
        
        // Retrieve data from likepoints table
        psLikes = con.prepareStatement(queryLikes);
        rsLikes = psLikes.executeQuery();
    %>
    <h3>PointOfInterest Table</h3>
    <table>
        <tr>
            <th>Country</th>
            <th>State</th>
            <th>City</th>
        </tr>
        <% while (rsPoints.next()) { %>
            <tr>
                <td><%= rsPoints.getString("country") %></td>
                <td><%= rsPoints.getString("state") %></td>
                <td><%= rsPoints.getString("city") %></td>
            </tr>
        <% } %>
    </table>

    <h3>Liked PointOfInterest Table</h3>
    <table>
        <tr>
        	<th>ID</th>
            <th>Country</th>
            <th>Likes</th>
            <th>Comment</th>
        </tr>
        <% while (rsLikes.next()) { %>
            <tr>
           		<td><%= rsLikes.getString("id") %></td>
                <td><%= rsLikes.getString("country") %></td>
                <td><%= rsLikes.getInt("likes") %></td>
                <td><%= rsLikes.getString("comment") %></td>
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

    <h1>Give Your Feedback - Comment Or Like</h1>
    <form action="addcom" method="post"> 
        Country: <select name="city2">
        <option>Select City</option>
        <% 
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pointOfInterset", "root", "9787");

                // Retrieve unique values from the "country" column of PointOfInterest table
                Statement stmt = con.createStatement();
                ResultSet rsCountries = stmt.executeQuery("SELECT DISTINCT country FROM pointofinterest");

                while (rsCountries.next()) {
                    String country = rsCountries.getString("country");
        %>
                    <option><%= country %></option>
        <%
                }
                rsCountries.close();
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </select> <br/><br/> <br/><br/>

        Like: <select name="like2">
            <option>0</option>
            <option>1</option>
        </select>
        <br/><br/>

        Comment: <input type="text" name="comment2" required /> <br/> <br/>

        <input type="submit" value="Submit"/>
    </form>
</body>
</html>
