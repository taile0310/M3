package furama.service.impl;

import furama.model.person.Employee;
import furama.repository.IEmployeeRepository;
import furama.repository.impl.EmployeeRepository;
import furama.service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepository();

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public boolean add(Employee employee) {
        return employeeRepository.add(employee);
    }

    @Override
    public boolean update(Employee employee) {
        return employeeRepository.update(employee);
    }

    @Override
    public boolean delete(int id) {
        return employeeRepository.delete(id);
    }

    @Override
    public List<Employee> findEmployee(String name) {
        return employeeRepository.findEmployee(name);
    }
}
