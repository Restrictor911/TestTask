package by.restrictor.testtask.service;

import by.restrictor.testtask.model.User;

import java.util.List;

/**
 * Created by Restrictor on 17.05.2016.
 */
public interface UserService {
    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> getUsersByName(String name, int page);

    List<User> listUsers(int page);

    int countPages();

    int countPages(String name);
}
