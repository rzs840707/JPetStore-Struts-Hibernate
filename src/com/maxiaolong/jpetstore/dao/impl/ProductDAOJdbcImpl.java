package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.HibernateSessionFactory;
import com.maxiaolong.jpetstore.dao.ProductDAO;
import com.maxiaolong.jpetstore.domain.Product;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class ProductDAOJdbcImpl implements ProductDAO {
    @Override
    public List<Product> getAll(String catid) {
        List<Product> productList = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            productList = (List<Product>) session.createQuery("from Product where catid=:catid").setString("catid", catid).list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return productList;
        }
    }
}
