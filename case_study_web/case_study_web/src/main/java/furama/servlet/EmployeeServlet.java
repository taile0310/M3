package furama.servlet;

import furama.model.person.Employee;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "employeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    private static List<Employee> employeeList = new ArrayList<>();

    static {
        employeeList.add(new Employee("Nguyen A", "01-01-2000", "123455", "0355555155",
                "nguyena@gmail.com", "Cao dang", "nhan vien", "2000000"));
        employeeList.add(new Employee("Nguyen B", "01-01-2000", "123466", "0355555255",
                "nguyena@gmail.com", "Dai hoc", "quan ly", "2900000"));
        employeeList.add(new Employee("Nguyen C", "01-01-2000", "123436", "0355555355",
                "nguyena@gmail.com", "Cao dang", "nhan vien", "2500000"));
        employeeList.add(new Employee("Nguyen D", "01-01-2000", "123496", "0355554555",
                "nguyena@gmail.com", "Dai hoc", "truong phong", "20000000"));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("employeeList", employeeList);
        req.getRequestDispatcher("/list_employee.jsp").forward(req,resp);
    }
}