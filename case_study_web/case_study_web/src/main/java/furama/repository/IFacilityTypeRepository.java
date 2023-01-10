package furama.repository;

import furama.model.facility.FacilityType;

import java.util.List;

public interface IFacilityTypeRepository {
    List<FacilityType> findAll();
}
