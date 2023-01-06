package furama.controller;

import furama.model.person.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Nguyen A", "25/12/2000", "4567893", "036266667", "nguyena@gmail.com", "Diamond", "Da Nang"));
        customerList.add(new Customer("Nguyen B", "20/12/2000", "4567892", "036664667", "nguyenab@gmail.com", "Platinium", "HCM"));
        customerList.add(new Customer("Nguyen C", "15/12/2000", "4567891", "036666567", "nguyenac@gmail.com", "Gold", "Ha Noi"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("view/list_customer.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
