package furama.model.facility;

public class Facility {
    private int id;
    private String name;
    private int area;
    private double cost;
    private int max_people;
    private String standard_room;
    private String description_other_convenience;
    private double pool_area;
    private int number_of_floors;
    private String facility_free;
    private int rent_type;
    private int facility_type;

    public Facility() {
    }

    public Facility(int id, String name, int area, double cost, int max_people, String standard_room, String description_other_convenience, double pool_area, int number_of_floors, String facility_free, int rent_type, int facility_type) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.max_people = max_people;
        this.standard_room = standard_room;
        this.description_other_convenience = description_other_convenience;
        this.pool_area = pool_area;
        this.number_of_floors = number_of_floors;
        this.facility_free = facility_free;
        this.rent_type = rent_type;
        this.facility_type = facility_type;
    }

    public Facility(String name, int area, double cost, int max_people, String standard_room, String description_other_convenience, double pool_area, int number_of_floors, String facility_free, int rent_type, int facility_type) {
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.max_people = max_people;
        this.standard_room = standard_room;
        this.description_other_convenience = description_other_convenience;
        this.pool_area = pool_area;
        this.number_of_floors = number_of_floors;
        this.facility_free = facility_free;
        this.rent_type = rent_type;
        this.facility_type = facility_type;
    }

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

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getMax_people() {
        return max_people;
    }

    public void setMax_people(int max_people) {
        this.max_people = max_people;
    }

    public String getStandard_room() {
        return standard_room;
    }

    public void setStandard_room(String standard_room) {
        this.standard_room = standard_room;
    }

    public String getDescription_other_convenience() {
        return description_other_convenience;
    }

    public void setDescription_other_convenience(String description_other_convenience) {
        this.description_other_convenience = description_other_convenience;
    }

    public double getPool_area() {
        return pool_area;
    }

    public void setPool_area(double pool_area) {
        this.pool_area = pool_area;
    }

    public int getNumber_of_floors() {
        return number_of_floors;
    }

    public void setNumber_of_floors(int number_of_floors) {
        this.number_of_floors = number_of_floors;
    }

    public String getFacility_free() {
        return facility_free;
    }

    public void setFacility_free(String facility_free) {
        this.facility_free = facility_free;
    }

    public int getRent_type() {
        return rent_type;
    }

    public void setRent_type(int rent_type) {
        this.rent_type = rent_type;
    }

    public int getFacility_type() {
        return facility_type;
    }

    public void setFacility_type(int facility_type) {
        this.facility_type = facility_type;
    }
}
