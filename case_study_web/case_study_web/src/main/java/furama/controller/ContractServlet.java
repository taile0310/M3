package furama.controller;

import furama.model.Contract;
import furama.service.IContractService;
import furama.service.impl.ContractService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "employeeServlet", value = "/contract")

public class ContractServlet extends HttpServlet {
    private IContractService contractService = new ContractService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListContract(req, resp);
                break;
        }
    }

    private void showListContract(HttpServletRequest req, HttpServletResponse resp) {
        List<Contract> contractList = contractService.findAll();
        req.setAttribute("contractList", contractList);
        try {
            req.getRequestDispatcher("view/list_detailed_contract.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
