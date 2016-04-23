package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.HibernateSessionFactory;
import com.maxiaolong.jpetstore.dao.UserDAO;
import com.maxiaolong.jpetstore.domain.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

/**
 * Created by maxiaolong on 2016/3/5.
 */
public class UserDAOJdbcImpl implements UserDAO {
    @Override
    public void save(User user) {
        try {
            Session session = HibernateSessionFactory.getSession();
            Transaction transaction = session.beginTransaction();  //不是getTransaction
            session.save(user);
            transaction.commit();  //就是这个原因，我的心好痛
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(User user) {
        try {
            Session session = HibernateSessionFactory.getSession();
            Transaction transaction = session.beginTransaction();
            session.saveOrUpdate(user); //临时态转化为持久态
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public User get(String username, String password) {
        User user = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            user = (User) session.createQuery("from User where userid=:userid and password=:password").setString("userid", username).setString("password", password).uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return user;
        }
    }

    @Override
    public List<User> getAll() {
        List<User> userList = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            userList = (List<User>) session.createQuery("from User").list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return userList;
        }
    }
}
