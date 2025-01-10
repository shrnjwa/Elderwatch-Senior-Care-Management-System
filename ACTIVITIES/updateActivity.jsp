<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.yourpackage.ActivityService" %>
<%@ page import="com.yourpackage.Activity" %>
<%
    // Get the updated activity details from the form
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String date = request.getParameter("date");
    String description = request.getParameter("description");
    String seniorId = request.getParameter("seniorId");
    String venue = request.getParameter("venue");

    // Create an Activity object with updated data
    Activity updatedActivity = new Activity(Integer.parseInt(id), name, date, description, seniorId, venue);

    // Call the service to update the activity
    ActivityService activityService = new ActivityService();
    boolean success = activityService.updateActivity(updatedActivity);

    // Redirect or show success/failure message
    if (success) {
        response.sendRedirect("activity-details.jsp"); // Redirect to the activity details page
    } else {
        out.println("Error updating activity!");
    }
%>
