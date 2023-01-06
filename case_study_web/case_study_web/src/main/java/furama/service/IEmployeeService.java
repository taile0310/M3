package furama.service;

import furama.model.person.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();
    void add(Employee employee);
    void update(String id);
    void delete(String id);
}
