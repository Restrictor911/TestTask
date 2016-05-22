package by.restrictor.testtask.service;

import by.restrictor.testtask.dao.UserDao;
import by.restrictor.testtask.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<User> getUsersByName(String name, int page) {
        return this.userDao.getUsersByName(name, page);
    }

    @Override
    @Transactional
    public List<User> listUsers(int page) {
        return this.userDao.listUsers(page);
    }

    @Override
    @Transactional
    public int countPages() {
        return this.userDao.countPages();
    }

    @Override
    @Transactional
    public int countPages(String name) {
        return this.userDao.countPages(name);
    }
}
