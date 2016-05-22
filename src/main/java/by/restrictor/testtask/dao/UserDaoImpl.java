package by.restrictor.testtask.dao;

import by.restrictor.testtask.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    private SessionFactory sessionFactory;
    private int resultsPerPage;


    public void setResultsPerPage(int resultsPerPage) {
        this.resultsPerPage = resultsPerPage;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, new Integer(id));

        if (user != null) session.delete(user);
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User)session.get(User.class, new Integer(id));
        return user;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> getUsersByName(String name, int page) {
        Session session = this.sessionFactory.getCurrentSession();
        String query = "from User where name like '%" + name + "%' order by name";
        List<User> list = session.createQuery(query)
                .setFirstResult(resultsPerPage * page)
                .setMaxResults(resultsPerPage)
                .list();
        return list;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers(int page) {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> list = session.createQuery("from User")
                .setFirstResult(resultsPerPage * page)
                .setMaxResults(resultsPerPage)
                .list();
        return list;
    }

    @Override
    public int countPages() {
        Session session = this.sessionFactory.getCurrentSession();
        long pages = (Long)session.createQuery("select count(*) from User")
                .uniqueResult()/resultsPerPage;
        return (int)pages;
    }

    @Override
    public int countPages(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        String query = "select count(*) from User where name like '%" + name + "%'";
        long pages = (Long)session.createQuery(query).uniqueResult()/resultsPerPage;
        return (int)pages;
    }
}
