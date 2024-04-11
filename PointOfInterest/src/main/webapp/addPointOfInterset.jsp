<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Point of Interest Form</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 60%;
        text-align: center;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-top: 0;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table img {
        width: 100%;
        height: 200%;
    }

    td {
        padding: 10px;
    }

    select, input[type="submit"] {
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
</style>
</head>
<body>

<h1>Please Add The PointOfInterest</h1>
<form action="addpoints" method="post"> 
    <table>
        <tr>
            <td> 
                <img src="test1.jpeg" alt="Your Image Description">
            </td>
            <td> 
                <img src="test2.jpeg" alt="Your Image Description">
            </td>
            <td> 
                <img src="test3.jpeg" alt="Your Image Description">
            </td>
        </tr>
        <tr>
            <td>
                City: 
                <select class="form-select" id="country" name="country">
 
 				    <option value="london">London</option>
 				    <option value="berlin">Berlin</option>
 				    <option value="tokyo">Tokyo</option>
				    <option value="manchester">Manchester</option>
				    <option value="birmingham">Birmingham</option>
				    <option value="liverpool">Liverpool</option>
				    <option value="glasgow">Glasgow</option>
				    <option value="edinburgh">Edinburgh</option>
				    <option value="bristol">Bristol</option>

				    <!-- Add more cities as needed -->
</select>
            </td>
            <td>
                Type: 
                <select name="state">
                    <option>Cinema</option>
                    <option>Restaurant</option>
                </select>
            </td>
            <td>
                PointOfInterest: 
                <select name="city">
                    <option>Malin</option>
                    <option>The English</option>
                </select>
            </td>
        </tr>
    </table>
    <input type="submit" value="Register"/>
</form>

</body>
</html>
