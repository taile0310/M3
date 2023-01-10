package furama.controller;

import furama.model.facility.CustomerType;
import furama.model.person.Customer;
import furama.service.ICustomerService;
import furama.service.ICustomerTypeService;
import furama.service.impl.CustomerService;
import furama.service.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    private ICustomerTypeService customerTypeService = new CustomerTypeService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListCustomer(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            case "update":
                updateCustomer(request,response);
                break;
        }
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String date_of_birth = request.getParameter("date_of_birth");
        String id_card = request.getParameter("id_card");
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int gender = Integer.parseInt(request.getParameter("gender"));
        int customer_type = Integer.parseInt(request.getParameter("customer_type_id"));
        Customer customer = new Customer(name, date_of_birth, id_card, phone, email, address, gender, customer_type);
        boolean check = customerService.add(customer);
        String mess = "Add Customer success";
        if (!check) {
            mess = " Not Add Customer success";
        }
        request.setAttribute("mess", mess);
        showListCustomer(request, response);

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = customerService.delete(id);
        String mess = "Delete Customer success";
        if (!check) {
            mess = "Not Delete Customer success";
        }
        request.setAttribute("mess", mess);
        showListCustomer(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String date_of_birth = request.getParameter("date_of_birth");
        String id_card = request.getParameter("id_card");
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        byte gender = Byte.parseByte(request.getParameter("gender"));
        int customer_type = Integer.parseInt(request.getParameter("customer_type_id"));
        Customer customer = new Customer(id, name,date_of_birth,id_card,phone,email,address,gender,customer_type);
        customerService.update(customer);
        showListCustomer(request,response);
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        request.setAttribute("customerTypeList",customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list_customer.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
