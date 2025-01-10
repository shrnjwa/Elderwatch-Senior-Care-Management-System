<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.yourpackage.ActivityService" %>
<%@ page import="com.yourpackage.Activity" %>
<%
    String activityId = request.getParameter("id");

    // Assuming you have a service class that fetches the activity by ID
    ActivityService activityService = new ActivityService();
    Activity activity = activityService.getActivityById(Integer.parseInt(activityId));

    if (activity == null) {
        response.sendRedirect("activity-details.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Activity</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        input[type="text"],
        input[type="date"],
        textarea,
        input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h2>Edit Activity</h2>
    <form action="updateActivity.jsp" method="post">
        <input type="hidden" name="id" value="${activity.id}" />
        
        <label for="name">Activity Name:</label>
        <input type="text" id="name" name="name" value="${activity.name}" required />

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="${activity.date}" required />

        <label for="description">Description:</label>
        <textarea id="description" name="description">${activity.description}</textarea>

        <label for="seniorId">Senior ID:</label>
        <input type="text" id="seniorId" name="seniorId" value="${activity.seniorId}" required />

        <label for="venue">Venue:</label>
        <input type="text" id="venue" name="venue" value="${activity.venue}" required />

        <input type="submit" value="Save Changes" />
    </form>

    <a href="activity-details.jsp" class="btn">Back to Activities</a>

</body>
</html>
