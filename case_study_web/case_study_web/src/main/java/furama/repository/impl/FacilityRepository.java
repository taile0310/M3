package furama.repository.impl;

import furama.model.facility.Facility;
import furama.repository.BaseRepository;
import furama.repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_FACILITY = "select * from facility";
    private final String INSERT_FACILITY= "insert into facility (`name`, area,cost,max_people,standard_room,description_other_convenience,pool_area,number_of_floors,facility_free,rent_type_id,facility_type_id) values (?,?,?,?,?,?,?,?,?,?,?)";
    private final String DELETE_FACILITY = "delete from facility where id = ?";
    @Override
    public List<Facility> findAll() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FACILITY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int area = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int max_people = resultSet.getInt("max_people");
                String standard_room = resultSet.getString("standard_room");
                String description_other_convenience = resultSet.getString("description_other_convenience");
                double pool_area = resultSet.getDouble("pool_area");
                int number_of_floors = resultSet.getInt("number_of_floors");
                String facility_free = resultSet.getString("facility_free");
                int rent_type = resultSet.getInt("rent_type_id");
                int facility_type = resultSet.getInt("facility_type_id");
                Facility facility = new Facility(id,name,area,cost,max_people,standard_room,description_other_convenience,
                        pool_area,number_of_floors,facility_free,rent_type,facility_type) ;
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return facilityList;
    }

    @Override
    public boolean add(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FACILITY);
            preparedStatement.setString(1,facility.getName());
            preparedStatement.setInt(2,facility.getArea());
            preparedStatement.setDouble(3,facility.getCost());
            preparedStatement.setInt(4,facility.getMax_people());
            preparedStatement.setString(5,facility.getStandard_room());
            preparedStatement.setString(6,facility.getDescription_other_convenience());
            preparedStatement.setDouble(7,facility.getPool_area());
            preparedStatement.setInt(8,facility.getNumber_of_floors());
            preparedStatement.setString(9,facility.getFacility_free());
            preparedStatement.setInt(10,facility.getRent_type());
            preparedStatement.setInt(11,facility.getFacility_type());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public boolean update(Facility facility) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY);
            preparedStatement.setInt(1,id);
            return preparedStatement.executeUpdate() > 0 ;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Facility> findFacility(String name) {
        return null;
    }
}
