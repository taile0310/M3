package furama.service;

import furama.model.facility.RentType;

import java.util.List;

public interface IRentTypeService {
    List<RentType> findAll();
}
