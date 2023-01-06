package furama.repository;

import furama.model.person.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();
    void add(Employee employee);
    void update(String id);
    void delete(String id);
}
