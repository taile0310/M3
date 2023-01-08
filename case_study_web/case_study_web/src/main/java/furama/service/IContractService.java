package furama.service;

import furama.model.Contract;

import java.util.List;

public interface IContractService {
    List<Contract> findAll();
    boolean addContract (Contract contract);
    boolean deleteContract (String name_customer);
    boolean updateContract (Contract contract);
}
