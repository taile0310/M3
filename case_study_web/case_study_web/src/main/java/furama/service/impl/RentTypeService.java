package furama.service.impl;

import furama.model.facility.RentType;
import furama.repository.IRentTypeRepository;
import furama.repository.impl.RentTypeRepository;
import furama.service.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    private IRentTypeRepository rentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> findAll() {
        return rentTypeRepository.findAll();
    }
}
