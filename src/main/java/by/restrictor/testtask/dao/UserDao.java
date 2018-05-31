package by.restrictor.testtask.dao;

import by.restrictor.testtask.model.User;

import java.util.List;

/**
 * Created by Restrictor on 17.05.2016.
 */
public interface UserDao {
    void addUser(User user);

    void updateUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> getUsersByName(String name, int page);

    List<User> listUsers(int page);

    int count();

    int count(String name);
}
