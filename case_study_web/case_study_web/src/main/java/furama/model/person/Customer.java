package furama.model.person;

import java.util.BitSet;
import java.util.Date;

public class Customer extends Person{
    private int customer_type;
    private String  gender;

    public Customer() {
    }

    public Customer(int id, String name, String date_of_birth, String id_card, String phone, String email, String address,String gender, int customer_type) {
        super(id, name, date_of_birth, id_card, phone, email, address);
        this.customer_type = customer_type;
        this.gender = gender;
    }

    public Customer(String name, String date_of_birth, String id_card, String phone, String email, String address, String gender, int customer_type) {
        super(name, date_of_birth, id_card, phone, email, address);
        this.customer_type = customer_type;
        this.gender = gender;
    }



    public int getCustomer_type() {
        return customer_type;
    }

    public void setCustomer_type(int customer_type) {
        this.customer_type = customer_type;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}

