package furama.service;

import furama.model.person.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();
    boolean add(Customer customer);
    boolean update(Customer customer);
    boolean delete(int id);
    List<Customer> findCustomer(String name);
}
