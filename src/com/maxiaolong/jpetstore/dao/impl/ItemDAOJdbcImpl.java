package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.HibernateSessionFactory;
import com.maxiaolong.jpetstore.dao.ItemDAO;
import com.maxiaolong.jpetstore.domain.Item;
import org.hibernate.Session;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class ItemDAOJdbcImpl implements ItemDAO {
    @Override
    public List<Item> getAll(String productid) {
        List<Item> itemList=null;
        try{
            Session session= HibernateSessionFactory.getSession();
            itemList=(List<Item>) session.createQuery("from Item where productid=:productid").setString("productid",productid).list();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return itemList;
        }
    }

    @Override
    public Double getListprice(String itemid) {
        Double listprice=null;
        try{
            Session session=HibernateSessionFactory.getSession();
            listprice=(Double)session.createQuery("select  listprice  from Item where  itemid=:itemid").setString("itemid",itemid).uniqueResult();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return listprice;
        }
    }

    @Override
    public Item getItemByItemId(String itemid) {
        Item item=null;
        try{
            Session session=HibernateSessionFactory.getSession();
            item=(Item)session.createQuery("from Item where itemid=:itemid").setString("itemid",itemid).uniqueResult();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return item;
        }
    }

    @Override
    public List<Item> getItemByName(String name) {
//        String sql="select * from item where name like?";
//        name=("%"+name+"%").trim();
//        return getForList(sql,name);
        List<Item> itemList=null;
        try{
            Session session=HibernateSessionFactory.getSession();
            itemList=(List<Item>) session.createQuery("from Item where name like ?").setString(0,"%"+name+"%").list();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return itemList;
        }
    }

    @Override
    public List<Item> getSearchItem(String itemName) {
//        String sql="select name from item where name like ? ";
//        itemName=("%"+itemName+"%").trim();
//        return getForList(sql,itemName);
        List<Item> itemList=null;
        try{
            Session session=HibernateSessionFactory.getSession();
            itemList=(List<Item>) session.createQuery("from Item where name like ?").setString(0,"%"+itemName+"%").list();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return itemList;
        }
    }

}
