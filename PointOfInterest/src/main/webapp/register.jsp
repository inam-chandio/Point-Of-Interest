<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration Form</title>
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

        input[type="submit"],
        input[type="button"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            padding: 10px;
            font-size: 16px;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45a049;
        }

        select {
            padding: 10px;
        }

        .login-button {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>User Registration Form</h1>
    <form action="regForm" method="post">
        Name: <input type="text" name="name1" required /> <br/><br/>
        Email: <input type="text" name="email1" required /> <br/><br/>
        Password: <input type="password" name="pass1" required /> <br/><br/>
        Gender: <input type="radio" name="gender1" value="Male" required/>Male
                <input type="radio" name="gender1" value="Female" required /> Female<br/><br/>
        City: <select name="city1" required>
                <option>Select City</option>
                <option>Larkana</option>
                <option>Sukkur</option>
                <option>Nawabshah</option>
            </select> <br/><br/>
        <input type="submit" value="Register"/>
         <input type="button" value="Login" onclick="location.href='login.jsp'"/>
    </form>

  
       
    
</body>
</html>
