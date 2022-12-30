package exercise.ss10_jsp_and_jstl;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "exercise.ss10_jsp_and_jstl.Servlet", value = "/customer")
public class Servlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","/img/conan-134737.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Đà Nẵng","/img/images.jfif"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-22","Bắc Giang","/img/conan-134737.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa","1983-08-23","HCM","/img/images2.jfif"));
        customerList.add(new Customer("Nguyễn Đình Thi","1983-08-24","Hải Phòng","/img/pngtree-anime-chibi-character-persentation-boy-png-image_2327012.jpg"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
