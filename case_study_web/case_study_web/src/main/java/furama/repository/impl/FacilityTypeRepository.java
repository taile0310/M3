package furama.repository.impl;

import furama.model.facility.FacilityType;
import furama.repository.BaseRepository;
import furama.repository.IFacilityRepository;
import furama.repository.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    private final String SELECT_FACILITY_TYPE = "select * from facility_type";
    @Override
    public List<FacilityType> findAll() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FACILITY_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                FacilityType facilityType = new FacilityType(id , name);
                facilityTypeList.add(facilityType);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return facilityTypeList;
    }
}
