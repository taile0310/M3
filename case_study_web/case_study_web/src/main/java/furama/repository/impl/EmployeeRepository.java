package furama.repository.impl;

import furama.model.person.Employee;
import furama.repository.BaseRepository;
import furama.repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private final String SELECT_EMPLOYEE = "select * from employee";
    private final String INSERT_EMPLOYEE = "insert into employee  (`name`, date_of_birth, id_card, phone_number, email, address, salary, position_id, education_degree_id, division_id) values (?,?,?,?,?,?,?,?,?,?)";
    private final String DELETE_EMPLOYEE = "delete from employee where id = ?";
    private final String UPDATE_EMPLOYEE = "call update_employee (?,?,?,?,?,?,?,?,?,?,?)";
    private final String SEARCH_EMPLOYEE = "select * from employee where `name` like ?";

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String date_of_birth = resultSet.getString("date_of_birth");
                String id_card = resultSet.getString("id_card");
                Double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int position_id = resultSet.getInt("position_id");
                int education_degree_id = resultSet.getInt("education_degree_id");
                int division_id = resultSet.getInt("division_id");
                Employee employee = new Employee(id, name, date_of_birth, id_card, phone, email, address,
                        salary, position_id, education_degree_id, division_id);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeList;
    }

    @Override
    public boolean add(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDate_of_birth());
            preparedStatement.setString(3, employee.getId_card());
            preparedStatement.setString(4, employee.getPhone());
            preparedStatement.setString(5, employee.getEmail());
            preparedStatement.setString(6, employee.getAddress());
            preparedStatement.setDouble(7, employee.getSalary());
            preparedStatement.setInt(8, employee.getPosition_id());
            preparedStatement.setInt(9, employee.getEducation_degree_id());
            preparedStatement.setInt(10, employee.getDivision_id());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public boolean update(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_EMPLOYEE);
            callableStatement.setInt(1, employee.getId());
            callableStatement.setString(2, employee.getName());
            callableStatement.setString(3, employee.getDate_of_birth());
            callableStatement.setString(4, employee.getId_card());
            callableStatement.setString(5, employee.getPhone());
            callableStatement.setString(6, employee.getEmail());
            callableStatement.setString(7, employee.getAddress());
            callableStatement.setDouble(8, employee.getSalary());
            callableStatement.setInt(9, employee.getPosition_id());
            callableStatement.setInt(10, employee.getEducation_degree_id());
            callableStatement.setInt(11, employee.getDivision_id());
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Employee> findEmployee(String name) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE);
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String date_of_birth = resultSet.getString("date_of_birth");
                String id_card = resultSet.getString("id_card");
                Double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int position_id = resultSet.getInt("position_id");
                int education_degree_id = resultSet.getInt("education_degree_id");
                int division_id = resultSet.getInt("division_id");
                Employee employee = new Employee(id, name, date_of_birth, id_card, phone, email, address,
                        salary, position_id, education_degree_id, division_id);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employeeList;
    }
}
