package furama.service.impl;

import furama.model.facility.Facility;
import furama.repository.IFacilityRepository;
import furama.repository.impl.FacilityRepository;
import furama.service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private IFacilityRepository facilityRepository = new FacilityRepository();
    @Override
    public List<Facility> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public boolean add(Facility facility) {
        return facilityRepository.add(facility);
    }

    @Override
    public boolean update(Facility facility) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return facilityRepository.delete(id);
    }

    @Override
    public List<Facility> findFacility(String name) {
        return null;
    }
}
