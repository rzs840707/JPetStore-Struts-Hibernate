package com.maxiaolong.jpetstore.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

/**
 * Created by maxiaolong on 2016/4/21 0021.
 */
public class HibernateSessionFactory {
    private final static String CONFIG_FILE_LOCATION = "/hibernate.cfg.xml";
    private static final ThreadLocal<Session> threadLcal = new ThreadLocal<Session>();

    private static Configuration configuration = new Configuration();
    private static ServiceRegistry serviceRegistry;
    private static SessionFactory sessionFactory;
    private static String configFile = CONFIG_FILE_LOCATION;

    //单例模式，初始化sessionFactory
    static {
        try {
            configuration.configure(configFile);
            serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            System.out.println("sessionFactory初始化成功！");
        } catch (Exception e) {
            System.out.println("sessionFactory初始化失败！");
            e.printStackTrace();
        }
    }

    public static Session getSession() throws HibernateException {
        Session session = (Session) threadLcal.get();
        if (session == null || !session.isOpen()) {
            if (sessionFactory == null) {
                rebuildSessionFactory();
            }
            session = (sessionFactory != null) ? sessionFactory.openSession() : null;
            threadLcal.set(session);
        }
        return session;
    }

    private static void rebuildSessionFactory() {
        try {
            configuration.configure(configFile);
            serviceRegistry = new ServiceRegistryBuilder().applySettings(configuration.getProperties()).buildServiceRegistry();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            System.out.println("sessionFactory重建成功！");
        } catch (Exception e) {
            System.out.println("sessionFactory重建失败！");
            e.printStackTrace();
        }
    }

    private static void closeSession() throws HibernateException {
        Session session = (Session) threadLcal.get();
        threadLcal.set(null);
        if (session != null) {
            session.close();
        }
    }
}
