package by.restrictor.testtask.service;

import by.restrictor.testtask.dao.UserDao;
import by.restrictor.testtask.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Override
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Override
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Override
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Override
    public List<User> getUsersByName(String name, int page) {
        return this.userDao.getUsersByName(name, page);
    }

    @Override
    public List<User> listUsers(int page) {
        return this.userDao.listUsers(page);
    }

    @Override
    public int countPages() {
        return this.userDao.count();
    }

    @Override
    public int countPages(String name) {
        return this.userDao.count(name);
    }
}
