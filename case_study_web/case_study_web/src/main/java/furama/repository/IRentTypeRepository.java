package furama.repository;

import furama.model.facility.RentType;

import java.util.List;

public interface IRentTypeRepository {
    List<RentType> findAll();
}
