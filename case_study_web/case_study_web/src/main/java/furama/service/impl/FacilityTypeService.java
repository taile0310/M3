package furama.service.impl;

import furama.model.facility.FacilityType;
import furama.repository.IFacilityTypeRepository;
import furama.repository.impl.FacilityTypeRepository;
import furama.service.IFacilityTypeService;

import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {
    private IFacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<FacilityType> findAll() {
        return facilityTypeRepository.findAll();
    }
}
