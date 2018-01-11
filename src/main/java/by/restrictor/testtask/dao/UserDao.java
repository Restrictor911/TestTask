package by.restrictor.testtask.dao;

import by.restrictor.testtask.model.User;

import java.util.List;

/**
 * Created by Restrictor on 17.05.2016.
 */
public interface UserDao {
    public void addUser(User user);

    public void updateUser(User user);

    public void removeUser(int id);

    public User getUserById(int id);

    public List<User> getUsersByName(String name, int page);

    public List<User> listUsers(int page);

    public int count();

    public int count(String name);
}
