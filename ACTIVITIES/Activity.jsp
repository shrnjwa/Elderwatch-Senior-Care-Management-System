<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Activity Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f3f4f6;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .btn {
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .edit-btn {
            background-color: #ffcc00;
            color: white;
        }
        .edit-btn:hover {
            background-color: #ff9900;
        }
    </style>
</head>
<body>

    <h1>Activity Details</h1>

    <table>
        <thead>
            <tr>
                <th>Activity ID</th>
                <th>Activity Name</th>
                <th>Date</th>
                <th>Description</th>
                <th>Senior ID</th>
                <th>Venue</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="activity" items="${activities}">
                <tr>
                    <td>${activity.id}</td>
                    <td>${activity.name}</td>
                    <td>${activity.date}</td>
                    <td>${activity.description}</td>
                    <td>${activity.seniorId}</td>
                    <td>${activity.venue}</td>
                    <td>
                        <a href="editActivity.jsp?id=${activity.id}" class="btn edit-btn">Edit</a>
                        <a href="deleteActivity.jsp?id=${activity.id}" class="btn delete-btn" onclick="return confirm('Are you sure you want to delete this activity?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="index.jsp" class="btn">Back to Home</a>

</body>
</html>
