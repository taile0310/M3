package furama.repository;

import furama.model.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> findAll();
    boolean addContract (Contract contract);
    boolean deleteContract (String name_customer);
    boolean updateContract (Contract contract);
}
