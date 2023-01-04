package cotroller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(req, resp);
                break;
            case "find":
                findCountry(req,resp);
                break;
            default:
                showList(req, resp);
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
            case "delete":
                delete(req, resp);
                break;
            case "update":
                update(req,resp);
                break;
            default:
                showList(req, resp);
                break;

        }
    }
    private void findCountry(HttpServletRequest req, HttpServletResponse resp) {
        String country = req.getParameter("country");
        req.setAttribute("user", userService.findByCountry(country));
        try {
            req.getRequestDispatcher("view/find.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name,email,country);
        userService.update(user);
        req.setAttribute("user", user);
        req.getRequestDispatcher("view/update.jsp").forward(req,resp);
        showList(req,resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        userService.delete(id);
        showList(req, resp);
    }


    private void add(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name, email, country);
        userService.add(user);
        showList(req, resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = userService.findAll();
        req.setAttribute("userList", userList);
        try {
            req.getRequestDispatcher("view/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}

