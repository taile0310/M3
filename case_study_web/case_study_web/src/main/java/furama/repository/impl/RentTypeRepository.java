package furama.repository.impl;

import furama.model.facility.RentType;
import furama.model.person.Person;
import furama.repository.BaseRepository;
import furama.repository.IRentTypeRepository;
import furama.service.impl.RentTypeService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private  final String SELECT_RENT_TYPE ="select * from rent_type";
    @Override
    public List<RentType> findAll() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RENT_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                RentType rentType = new RentType(id ,name);
                rentTypeList.add(rentType);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return rentTypeList;
    }
}
