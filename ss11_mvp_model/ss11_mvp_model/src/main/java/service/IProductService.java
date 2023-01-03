package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void create(Product product);

    void update(Product product);

    void delete(String id);

    void showProduct(String id);

    void search(String name);

    Product findById(String id);

}
