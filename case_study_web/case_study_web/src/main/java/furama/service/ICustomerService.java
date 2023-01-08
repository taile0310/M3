package furama.service;

import furama.model.person.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    boolean add(Customer customer);
    boolean update(String id);
    boolean delete(int id);
}
