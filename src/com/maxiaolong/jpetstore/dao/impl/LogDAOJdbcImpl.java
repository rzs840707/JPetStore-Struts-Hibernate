package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.HibernateSessionFactory;
import com.maxiaolong.jpetstore.dao.LogDAO;
import com.maxiaolong.jpetstore.domain.Log;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class LogDAOJdbcImpl implements LogDAO {
    @Override
    public void saveLog(Log log) {
//        String sql="insert into log(userid,timestamp,dowhat)" +
//                "values(?,?,?)";
//        update(sql,log.getUserid(),log.getTimestamp(),log.getDowhat());
        try {
            Session session = HibernateSessionFactory.getSession();
            Transaction transaction = session.beginTransaction();
            session.saveOrUpdate(log);
            transaction.commit();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Log> getLog() {
//        String sql="select * from log";
//        return getForList(sql);
        List<Log> logList = null;
        try {
            Session session = HibernateSessionFactory.getSession();
            logList = (List<Log>) session.createQuery("from Log ").list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return logList;
        }
    }
}
