package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    void add(User user);
    void update(User user);
    boolean delete(int id);
    List<User> findByCountry(String country);

}
