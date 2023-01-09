package furama.service;

import furama.model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAll();
    boolean add(Facility facility);
    boolean update(Facility facility);
    boolean delete(int id);
    List<Facility> findFacility(String name);
}
