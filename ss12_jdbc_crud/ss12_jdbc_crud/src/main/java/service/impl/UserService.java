package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void add(User user) {
        userRepository.add(user);

    }

    @Override
    public void update(User user) {
        userRepository.update(user);
    }

    @Override
    public boolean delete(int id) {
     return userRepository.delete(id);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepository.findByCountry(country);
    }
}
