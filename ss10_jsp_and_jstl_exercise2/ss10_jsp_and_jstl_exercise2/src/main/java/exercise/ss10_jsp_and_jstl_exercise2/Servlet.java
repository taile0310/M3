package exercise.ss10_jsp_and_jstl_exercise2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double num1 = Double.parseDouble(request.getParameter("num1"));
        double num2 = Double.parseDouble(request.getParameter("num2"));
        double addition =  num1 + num2;
        double subtraction = num1-num2;
        double multiplication = num1 * num2;
        double division = num1/num2;
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("firstOperand",num1);
        request.setAttribute("secondOperand",num2);
        request.setAttribute("addition",addition);
        request.setAttribute("subtraction",subtraction);
        request.setAttribute("multiplication",multiplication);
        request.setAttribute("division",division);
        requestDispatcher.forward(request,response);


    }
}
