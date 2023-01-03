package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    boolean create(Product product);

    void update(Product product);

    void delete(String id);

    void showProduct(String id);

    void search(String name);


}
