package furama.repository;


import furama.model.person.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
    boolean add(Customer customer);
    boolean update(Customer customer);
    boolean delete(int id);
    List<Customer> findCustomer(String name);
}
