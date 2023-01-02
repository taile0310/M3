package furama.model.facility;

public abstract class Facility {
    private String name;
    private String area;
    private String cost;
    private String max_people;
    private String rent_type;

    public Facility() {
    }

    public Facility(String name, String area, String cost, String max_people, String rent_type) {
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.max_people = max_people;
        this.rent_type = rent_type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public String getMax_people() {
        return max_people;
    }

    public void setMax_people(String max_people) {
        this.max_people = max_people;
    }

    public String getRent_type() {
        return rent_type;
    }

    public void setRent_type(String rent_type) {
        this.rent_type = rent_type;
    }
}
