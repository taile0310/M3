package furama.model.facility;

public class Villa extends Facility {
    private String standard_room;
    private String description_other_convenience;
    private String pool_area;
    private String num_of_floors;

    public Villa() {
    }

    public Villa(String name, String area, String cost, String max_people, String rent_type,
                 String standard_room, String description_other_convenience, String pool_area, String num_of_floors) {
        super(name, area, cost, max_people, rent_type);
        this.standard_room = standard_room;
        this.description_other_convenience = description_other_convenience;
        this.pool_area = pool_area;
        this.num_of_floors = num_of_floors;
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

    public String getPool_area() {
        return pool_area;
    }

    public void setPool_area(String pool_area) {
        this.pool_area = pool_area;
    }

    public String getNum_of_floors() {
        return num_of_floors;
    }

    public void setNum_of_floors(String num_of_floors) {
        this.num_of_floors = num_of_floors;
    }
}
