package service.impl;

import model.Product;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product("1", "hoa", "20000", "hoa hong", "tiem hoa hong"));
        productList.add(new Product("2", "bong", "25000", "bong tulip", "tiem hoa hong"));
        productList.add(new Product("3", "hoa", "22000", "hoa huong duong", "tiem hoa hong"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void create(Product product) {
        productList.add(product);

    }

    @Override
    public void update(Product product) {
        productList.add(product);

    }

    @Override
    public void delete(String id) {
        productList.remove(id);

    }

    @Override
    public void showProduct(String id) {

    }

    @Override
    public void search(String name) {

    }

    @Override
    public Product findById(String id) {
        return productList.get(Integer.parseInt(id));

    }
}
