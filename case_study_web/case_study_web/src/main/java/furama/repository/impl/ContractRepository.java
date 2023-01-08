package furama.repository.impl;

import furama.model.Contract;
import furama.repository.IContractRepository;

import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static List<Contract> contractList = new ArrayList<>();
    static {
        contractList.add(new Contract("Room Twin 01","Nguyen A","08/12/2020","08/12/2020","0","1000000"));
        contractList.add(new Contract("Room Twin 02","Nguyen B","08/12/2020","08/12/2020","1000000","1000000"));
        contractList.add(new Contract("Villa Beach Front","Nguyen C","14/07/2020","21/07/2020","500000","3000000"));
        contractList.add(new Contract("House Princess 01","Nguyen D","08/12/2020","10/12/2020","1000000","2000000"));
    }
    @Override
    public List<Contract> findAll() {

        return contractList;
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
