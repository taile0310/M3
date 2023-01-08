package furama.model;

public class Contract {
    private String name_service;
    private String name_customer;
    private String start_day;
    private String end_day;
    private String deposits;
    private String total;

    public Contract() {
    }

    public Contract(String name_service, String name_customer, String start_day, String end_day, String deposits, String total) {
        this.name_service = name_service;
        this.name_customer = name_customer;
        this.start_day = start_day;
        this.end_day = end_day;
        this.deposits = deposits;
        this.total = total;
    }

    public String getName_service() {
        return name_service;
    }

    public void setName_service(String name_service) {
        this.name_service = name_service;
    }

    public String getName_customer() {
        return name_customer;
    }

    public void setName_customer(String name_customer) {
        this.name_customer = name_customer;
    }

    public String getStart_day() {
        return start_day;
    }

    public void setStart_day(String start_day) {
        this.start_day = start_day;
    }

    public String getEnd_day() {
        return end_day;
    }

    public void setEnd_day(String end_day) {
        this.end_day = end_day;
    }

    public String getDeposits() {
        return deposits;
    }

    public void setDeposits(String deposits) {
        this.deposits = deposits;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}
