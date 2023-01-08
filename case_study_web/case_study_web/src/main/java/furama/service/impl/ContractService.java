package furama.service.impl;

import furama.model.Contract;
import furama.repository.IContractRepository;
import furama.repository.impl.ContractRepository;
import furama.service.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private IContractRepository contractRepository = new ContractRepository();

    @Override
    public List<Contract> findAll() {
        return contractRepository.findAll();
    }

    @Override
    public boolean addContract(Contract contract) {
        return false;
    }

    @Override
    public boolean deleteContract(String name_customer) {
        return false;
    }

    @Override
    public boolean updateContract(Contract contract) {
        return false;
    }
}
