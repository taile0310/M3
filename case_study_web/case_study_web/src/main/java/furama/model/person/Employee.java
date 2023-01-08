package furama.model.person;

import java.util.Date;

public class Employee extends Person {
    private Double salary;
    private int position_id;
    private int education_degree_id;
    private int division_id;

    public Employee() {
    }

    public Employee(int id, String name, String date_of_birth, String id_card, String phone, String email, String address, Double salary, int position_id, int education_degree_id, int division_id) {
        super(id, name, date_of_birth, id_card, phone, email, address);
        this.salary = salary;
        this.position_id = position_id;
        this.education_degree_id = education_degree_id;
        this.division_id = division_id;
    }

    public Employee(String name, String date_of_birth, String id_card, String phone, String email, String address, Double salary, int position_id, int education_degree_id, int division_id) {
        super(name, date_of_birth, id_card, phone, email, address);
        this.salary = salary;
        this.position_id = position_id;
        this.education_degree_id = education_degree_id;
        this.division_id = division_id;
    }


    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public int getEducation_degree_id() {
        return education_degree_id;
    }

    public void setEducation_degree_id(int education_degree_id) {
        this.education_degree_id = education_degree_id;
    }

    public int getDivision_id() {
        return division_id;
    }

    public void setDivision_id(int division_id) {
        this.division_id = division_id;
    }
}
