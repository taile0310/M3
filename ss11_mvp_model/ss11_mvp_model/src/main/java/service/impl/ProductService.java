package service.impl;

import model.Product;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class ProductService implements IProductService {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "hoa", "20000", "hoa hong", "tiem hoa hong"));
        productList.add(new Product(2, "bong", "25000", "bong tulip", "tiem hoa hong"));
        productList.add(new Product(3, "hoa", "22000", "hoa huong duong", "tiem hoa hong"));
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
        for (Product pro : productList) {
            if (product.getId() == pro.getId()){
                pro.setId(product.getId());
                pro.setName(product.getName());
                pro.setPrice(product.getPrice());
                pro.setDescribe(product.getDescribe());
                pro.setProducer(product.getProducer());
            }
        }
    }


    @Override
    public void delete(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                productList.remove(i);
                break;
            }
        }
    }

    @Override
    public void showProduct(String id) {

    }

    @Override
    public void search(String name) {

    }

    @Override
    public Product findById(int id) {
        for (Product pro: productList) {
            if (pro.getId()== id){
                return pro;
            }
        }
        return null;
    }
}
