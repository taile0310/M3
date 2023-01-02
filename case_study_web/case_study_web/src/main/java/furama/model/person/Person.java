package furama.model.person;

public abstract class Person {
    private String name;
    private String date_of_birth;
    private String id_card;
    private String phone;
    private String email;

    public Person() {
    }

    public Person(String name, String date_of_birth, String id_card, String phone, String email) {
        this.name = name;
        this.date_of_birth = date_of_birth;
        this.id_card = id_card;
        this.phone = phone;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getId_card() {
        return id_card;
    }

    public void setId_card(String id_card) {
        this.id_card = id_card;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
