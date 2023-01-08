package furama.repository.impl;

import furama.model.person.Customer;
import furama.model.person.Person;
import furama.repository.BaseRepository;
import furama.repository.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_CUSTOMER = "select * from customer";
    private final String INSERT_CUSTOMER = "insert into customer (`name`,date_of_birth,gender,id_card,phone_number,email,address,customer_type_id) values (?,?,?,?,?,?,?,?)";
    private final String DELETE_CUSTOMER = "delete from customer where id = ?";
    private final String UPDATE_CUSTOMER = "call update_customer (?,?,?,?,?,?,?,?,?)";
    @Override

    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String date_of_birth = resultSet.getString("date_of_birth");
                String id_card = resultSet.getString("id_card");
                String phone = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String gender = resultSet.getString("gender");
                int customer_type = resultSet.getInt("customer_type_id");
                Customer customer = new Customer(id, name, date_of_birth, id_card, phone, email, address, gender, customer_type);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerList;

    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setString(1,customer.getName());
            preparedStatement.setString(2,customer.getDate_of_birth());
            preparedStatement.setString(3,customer.getId_card());
            preparedStatement.setString(4,customer.getPhone());
            preparedStatement.setString(5,customer.getEmail());
            preparedStatement.setString(6,customer.getAddress());
            preparedStatement.setString(7, customer.getGender());
            preparedStatement.setInt(8,customer.getCustomer_type());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public boolean update(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_CUSTOMER);
            callableStatement.setInt(1, customer.getId());
            callableStatement.setString(2,customer.getName());
            callableStatement.setString(3,customer.getDate_of_birth());
            callableStatement.setString(4,customer.getId_card());
            callableStatement.setString(5,customer.getPhone());
            callableStatement.setString(6,customer.getEmail());
            callableStatement.setString(7,customer.getAddress());
            callableStatement.setString(8,customer.getGender());
            callableStatement.setInt(9,customer.getCustomer_type());
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public List<Customer> findCustomer(String name) {
        return null;
    }
}
