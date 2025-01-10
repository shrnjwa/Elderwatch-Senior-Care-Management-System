<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        // Setup database connection
        String url = "jdbc:derby://localhost:1527/ELDERWATCHDB";
        String user = "app";
        String password = "app";
        conn = DriverManager.getConnection(url, user, password);

        // Delete query
        String query = "DELETE FROM activities WHERE id = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, id);

        int rowsDeleted = stmt.executeUpdate();
        if (rowsDeleted > 0) {
            out.println("<script>alert('Activity deleted successfully!'); window.location='activity-details.jsp';</script>");
        } else {
            out.println("<script>alert('Error deleting activity!'); window.location='activity-details.jsp';</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>alert('Database error!'); window.location='activity-details.jsp';</script>");
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
