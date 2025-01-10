public class Activity {
    private int id;
    private String name;
    private String date;
    private String description;
    private String seniorId;
    private String venue;

    // Constructor
    public Activity(int id, String name, String date, String description, String seniorId, String venue) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.description = description;
        this.seniorId = seniorId;
        this.venue = venue;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSeniorId() {
        return seniorId;
    }

    public void setSeniorId(String seniorId) {
        this.seniorId = seniorId;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }
}
