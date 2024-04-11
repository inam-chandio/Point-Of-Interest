<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            margin: 50px;
        }

        h2 {
            color: #333;
        }

        form {
            margin-top: 20px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Welcome to the Home Page</h2>

    <!-- Button to navigate to register.jsp -->
    <form action="register.jsp">
        <input type="submit" value="USER">
    </form>

    <!-- Button to navigate to adminRegister.jsp -->
    <form action="adminRegister.jsp">
        <input type="submit" value="ADMINISTRATOR">
    </form>
</body>
</html>
