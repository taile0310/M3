package furama.model.person;

public class Customer extends Person{
    private String customer_type;
    private String address;

    public Customer() {
    }

    public Customer(String name, String date_of_birth, String id_card, String phone, String email, String customer_type, String address) {
        super(name, date_of_birth, id_card, phone, email);
        this.customer_type = customer_type;
        this.address = address;
    }

    public String getCustomer_type() {
        return customer_type;
    }

    public void setCustomer_type(String customer_type) {
        this.customer_type = customer_type;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
