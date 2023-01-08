package furama.model.person;

import java.util.Date;

public class Customer extends Person{
    private String customer_type;
    private String address;

    public Customer() {
    }

    public Customer(int id, String name, String date_of_birth, String id_card, String phone, String email, String address, String customer_type, String address1) {
        super(id, name, date_of_birth, id_card, phone, email, address);
        this.customer_type = customer_type;
        this.address = address1;
    }

    public String getCustomer_type() {
        return customer_type;
    }

    public void setCustomer_type(String customer_type) {
        this.customer_type = customer_type;
    }

    @Override
    public String getAddress() {
        return address;
    }

    @Override
    public void setAddress(String address) {
        this.address = address;
    }
}
