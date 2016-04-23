package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.CategoryDAO;
import com.maxiaolong.jpetstore.dao.HibernateSessionFactory;
import com.maxiaolong.jpetstore.domain.Category;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/6.
 */
public class CategoryDAOJdbcImpl implements CategoryDAO {
    @Override

    public List<Category> getAll() {
        List<Category> categoryList = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            categoryList = (List<Category>) session.createQuery("from Category").list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println(categoryList);
            return categoryList;
        }
    }

    @Override
    public Category getCategory(String catid) {
        Category category = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            category = (Category) session.createQuery("from Category where catid=:catid").setString("catid", catid).uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return category;
        }
    }

}
