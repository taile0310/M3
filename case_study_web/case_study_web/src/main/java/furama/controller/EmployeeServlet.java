package furama.controller;

import furama.model.person.Employee;
import furama.service.IEmployeeService;
import furama.service.impl.EmployeeService;

import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "employeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addEmployee(req, resp);
                break;
            case "delete":
                deleteEmployee(req, resp);
                break;
            case "update":
                updateEmployee(req, resp);
                break;
            case "find":
                findEmployee(req, resp);
                break;
            default:
                showListEmployee(req, resp);
                break;
        }

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showListEmployee(req, resp);
                break;
        }
    }


    private void addEmployee(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String date_of_birth = req.getParameter("date_of_birth");
        String id_card = req.getParameter("id_card");
        Double salary = Double.parseDouble(req.getParameter("salary"));
        String phone = req.getParameter("phone_number");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        int position_id = Integer.parseInt(req.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(req.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(req.getParameter("division_id"));
        Employee employee = new Employee(name, date_of_birth, id_card, phone, email, address, salary, position_id, education_degree_id, division_id);
        boolean check = employeeService.add(employee);
        String mess = "Add Employee success";
        if (!check) {
            mess = "Not Add Employee success";
        }
        req.setAttribute("mess", mess);
        showListEmployee(req, resp);
    }

    private void deleteEmployee(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        boolean check = employeeService.delete(id);
        String mess = "Delete Employee success";
        if (!check) {
            mess = "Not Delete Employee success";
        }
        req.setAttribute("mess", mess);
        showListEmployee(req, resp);
    }

    private void updateEmployee(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String date_of_birth = req.getParameter("date_of_birth");
        String id_card = req.getParameter("id_card");
        Double salary = Double.parseDouble(req.getParameter("salary"));
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        int position_id = Integer.parseInt(req.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(req.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(req.getParameter("division_id"));
        Employee employee = new Employee(id, name, date_of_birth, id_card, phone, email, address, salary, position_id, education_degree_id, division_id);
        employeeService.update(employee);
        showListEmployee(req, resp);

    }


    private void showListEmployee(HttpServletRequest req, HttpServletResponse resp) {
        List<Employee> employeeList = employeeService.findAll();
        req.setAttribute("employeeList", employeeList);
        try {
            req.getRequestDispatcher("view/list_employee.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void findEmployee(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        List<Employee> employeeList = employeeService.findEmployee(name);
        req.setAttribute("employeeList", employeeList);
        showListEmployee(req,resp);

    }




}