package furama.repository;

import furama.model.person.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();
    boolean add(Employee employee);
    boolean update(Employee employee);
    boolean delete(int id);
    List<Employee> findEmployee(String name);
}
