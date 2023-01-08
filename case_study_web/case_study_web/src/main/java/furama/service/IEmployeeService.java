package furama.service;

import furama.model.person.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();
    boolean add(Employee employee);
    boolean update(Employee employee);
    boolean delete(int id);
    List<Employee> findEmployee(String name);
}
