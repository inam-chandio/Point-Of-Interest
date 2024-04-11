<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>UserRegister</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e0e0e0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 0;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            outline: none;
        }

        input[type="radio"] {
            margin-right: 5px;
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

        select {
            padding: 10px;
        }

        /* Bold styling for JSP attributes */
        %@ page, head, meta, title {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>User Login Form</h1>
    <form action="loginForm" method="post">
        UserName: <input type="text" name="name1" /> <br/><br/>
        Password: <input type="password" name="pass1" /> <br/><br/>
        <input type="submit" value="Login"/>
    </form>
</body>
</html>
