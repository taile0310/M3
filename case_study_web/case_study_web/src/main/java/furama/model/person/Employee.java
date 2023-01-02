package furama.model.person;

public class Employee extends Person {
    private String education_degree_id;
    private String position_id;
    private String salary;

    public Employee() {
    }

    public Employee(String name, String date_of_birth, String id_card, String phone, String email, String education_degree_id, String position_id, String salary) {
        super(name, date_of_birth, id_card, phone, email);
        this.education_degree_id = education_degree_id;
        this.position_id = position_id;
        this.salary = salary;
    }

    public String getEducation_degree_id() {
        return education_degree_id;
    }

    public void setEducation_degree_id(String education_degree_id) {
        this.education_degree_id = education_degree_id;
    }

    public String getPosition_id() {
        return position_id;
    }

    public void setPosition_id(String position_id) {
        this.position_id = position_id;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }
}
