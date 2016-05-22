package by.restrictor.testtask.service;

import by.restrictor.testtask.model.User;

import java.util.List;

/**
 * Created by Restrictor on 17.05.2016.
 */
public interface UserService {
    public void addUser(User user);

    public void updateUser(User user);

    public void removeUser(int id);

    public User getUserById(int id);

    public List<User> getUsersByName(String name, int page);

    public List<User> listUsers(int page);

    public int countPages();

    public int countPages(String name);
}