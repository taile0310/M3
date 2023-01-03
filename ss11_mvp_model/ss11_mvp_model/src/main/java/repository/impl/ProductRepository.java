package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {

    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public boolean create(Product product) {

        return productList.add(product);
    }

    @Override
    public void update(Product product) {

    }

    @Override
    public void delete(String id) {

    }

    @Override
    public void showProduct(String id) {

    }

    @Override
    public void search(String name) {

    }
}
