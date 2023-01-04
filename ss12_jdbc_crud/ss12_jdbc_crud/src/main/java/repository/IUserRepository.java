package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();
    void add(User user);
    void update(User user);
    void delete(int id );
    List<User> findByCountry(String country);
}
