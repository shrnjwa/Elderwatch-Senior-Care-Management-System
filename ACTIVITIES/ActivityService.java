import java.sql.*;
import util.DBConnection;

public class ActivityService {

    // Method to get an Activity by ID
    public Activity getActivityById(int id) {
        Activity activity = null;
        String query = "SELECT * FROM activities WHERE id = ?";
        
        try (Connection conn = DBConnection.createConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                activity = new Activity(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("date"),
                    rs.getString("description"),
                    rs.getString("seniorId"),
                    rs.getString("venue")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activity;
    }

    // Method to update an Activity
    public boolean updateActivity(Activity activity) {
        String query = "UPDATE activities SET name = ?, date = ?, description = ?, seniorId = ?, venue = ? WHERE id = ?";
        
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, activity.getName());
            stmt.setString(2, activity.getDate());
            stmt.setString(3, activity.getDescription());
            stmt.setString(4, activity.getSeniorId());
            stmt.setString(5, activity.getVenue());
            stmt.setInt(6, activity.getId());
            
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to create a new Activity
    public boolean createActivity(Activity activity) {
        String query = "INSERT INTO activities (name, date, description, seniorId, venue) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, activity.getName());
            stmt.setString(2, activity.getDate());
            stmt.setString(3, activity.getDescription());
            stmt.setString(4, activity.getSeniorId());
            stmt.setString(5, activity.getVenue());
            
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to delete an Activity by ID
    public boolean deleteActivity(int id) {
        String query = "DELETE FROM activities WHERE id = ?";
        
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setInt(1, id);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
