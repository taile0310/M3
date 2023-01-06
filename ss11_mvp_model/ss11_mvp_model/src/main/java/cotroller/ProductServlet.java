package cotroller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(req, resp);
                break;
            case "update":
                update(req, resp);
                break;
            default:
                showList(req, resp);
                break;
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            case "update":
                showUpdate(req, resp);
                break;
            default:
                showList(req, resp);
                break;
        }
    }

    private void showUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.getRequestDispatcher("view/product/update.jsp").forward(req, resp);
    }


    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/product/create.jsp").forward(req, resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Product> productList = productService.findAll();
        req.setAttribute("productList", productList);
        try {
            req.getRequestDispatcher("view/product/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void delete(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.delete(id);
        showList(req, resp);
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String describe = req.getParameter("describe");
        String producer = req.getParameter("producer");
        Product product = new Product(id, name, price, describe, producer);
        productService.create(product);
        showList(req, resp);
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String describe = req.getParameter("describe");
        String producer = req.getParameter("producer");


        if (productService.findById(id) == null){
            return;
        }
        Product product = new Product(id,name,price,describe,producer) ;
        productService.update(product);
        showList(req, resp);
    }
}