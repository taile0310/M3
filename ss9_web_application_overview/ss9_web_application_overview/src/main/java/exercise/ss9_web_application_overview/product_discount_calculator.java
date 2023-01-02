package exercise.ss9_web_application_overview;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "Calculator", value = "/display-discount")
public class product_discount_calculator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double price = Double.parseDouble(req.getParameter("prices"));
        int dis = Integer.parseInt(req.getParameter("discount"));
        double result = price * dis * 0.01;
        req.setAttribute("prices", price);
        req.setAttribute("discount", dis);
        req.setAttribute("total", result);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(req, resp);
    }
}