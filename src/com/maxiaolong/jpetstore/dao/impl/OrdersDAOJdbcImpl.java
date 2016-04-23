package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.HibernateSessionFactory;
import com.maxiaolong.jpetstore.dao.OrdersDAO;
import com.maxiaolong.jpetstore.domain.Orders;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class OrdersDAOJdbcImpl implements OrdersDAO {

    @Override
    public void saveOrUpdate(Orders orders) {
//        String sql = "select * from orders where ordersid=? and itemid=? and status=?";
//        //有此item的订单且没付款,update
//        if (get(sql, orders.getOrdersid(), orders.getItemid(),0) != null) {
//            String updateSql = "update orders set quatity=? , totalprice=? where ordersid=? and itemid=?";
//            update(updateSql, orders.getQuatity(), orders.getTotalprice(), orders.getOrdersid(), orders.getItemid());
//        }
//        //没有此item的订单,insert into
//       else{
//            String updateSql2= "insert into orders (ordersid,itemid,quatity,totalprice,status) values(?,?,?,?,?)";
//            update(updateSql2, orders.getOrdersid(), orders.getItemid(), orders.getQuatity(), orders.getTotalprice(),orders.getStatus());
//        }
        Session session = HibernateSessionFactory.getSession();
        Transaction transaction = session.beginTransaction();
        try {
            Orders orders1 = (Orders) session.createQuery("from Orders where ordersid=:ordersid and itemid=:itemid and status=:status")
                    .setString("ordersid", orders.getOrdersid()).setString("itemid", orders.getItemid()).setInteger("status", 0).uniqueResult();
            if (orders1 != null) {
                //具体操作明天想想
                session.createQuery("update Orders set quatity=:quatity, totalprice=:totalprice where ordersid=:ordersid and itemid=:itemid")
                        .setInteger("quatity", orders.getQuatity()).setDouble("totalprice", orders.getTotalprice()).setString("ordersid", orders.getOrdersid())
                        .setString("itemid", orders.getItemid()).executeUpdate();
            } else {
                session.save(orders);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            transaction.commit();
            session.close();
        }

    }

    @Override
    public void delete(String ordersid, String itemid) {
//        String sql = "delete  from orders where ordersid=? and itemid=? and status=?";
//        update(sql, ordersid,itemid,0);
        try {
            Session session = HibernateSessionFactory.getSession();
            Transaction transaction = session.beginTransaction();
            session.createQuery("delete from Orders where ordersid=? and itemid=? and status=?")
                    .setString(0, ordersid).setString(1, itemid).setInteger(2, 0).executeUpdate();
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getStatus(Orders orders) {
//        String sql = "select status from orders where ordersid=? and itemid=?";
//        return getForValue(sql, orders.getOrdersid(), orders.getItemid());
        int status = 0;
        try {
            Session session = HibernateSessionFactory.getSession();
            status = (Integer) session.createQuery(" select status  from Orders where ordersid=? and itemid=?")
                    .setString(0, orders.getOrdersid()).setString(1, orders.getItemid()).uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return status;
        }
    }

    @Override
    public List<Orders> getAllOders(String ordersid) {
//        String sql = "select * from orders where ordersid=? and status =0";
//        return getForList(sql, ordersid);
        List<Orders> ordersList = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            ordersList = (List<Orders>) session.createQuery("from Orders where ordersid=? and status=0")
                    .setString(0, ordersid).list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return ordersList;
        }
    }

    @Override
    public Double getTotalValue(String ordersid) {
//        String sql = "select sum(totalprice) from orders where ordersid=? and status=0";
//        return getForValue(sql, ordersid);
        Double totalValue = 0.0;
        try {
            Session session = HibernateSessionFactory.getSession();
            totalValue = (Double) session.createQuery(" select sum(totalprice) from Orders where ordersid=? and status=0")
                    .setString(0, ordersid).uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return totalValue;
        }

    }

    @Override
    public void pay(String ordersid) {
//        String sql = "update orders set status=1 where ordersid=? and status=0";
//        update(sql, ordersid);
        try {
            Session session = HibernateSessionFactory.getSession();
            session.createQuery("update Orders set status=1 where ordersid=? and status=0")
                    .setString(0, ordersid).executeUpdate();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void purchase(Orders orders) {
//        String sql = "update orders set set quatity=? , totalprice=?,status=? where ordersid=? and itemid=?";
//        update(sql, orders.getQuatity(), orders.getTotalprice(), 1, orders.getOrdersid(), orders.getItemid());
        try {
            Session session = HibernateSessionFactory.getSession();
            session.createQuery("update Orders set quatity=? , totalprice=?,status=1 where ordersid=? and itemid=?")
                    .setInteger(0, orders.getQuatity()).setDouble(1, orders.getTotalprice()).setString(2, orders.getOrdersid())
                    .setString(3, orders.getItemid()).executeUpdate();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
