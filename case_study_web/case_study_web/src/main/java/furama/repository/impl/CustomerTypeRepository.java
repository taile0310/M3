package furama.repository.impl;

import furama.model.facility.CustomerType;
import furama.repository.BaseRepository;
import furama.repository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private final String SELECT_CUSTOMER_TYPE = "select * from customer_type";
    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                CustomerType customerType = new CustomerType(id,name);
                customerTypes.add(customerType);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerTypes;
    }
}
