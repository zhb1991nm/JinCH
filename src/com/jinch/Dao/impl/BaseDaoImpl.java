package com.jinch.Dao.impl;

import com.jinch.Dao.IBaseDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 敏华 on 2014/7/31.
 */
public abstract class BaseDaoImpl<T,ID> extends HibernateDaoSupport implements IBaseDao<T,ID> {

    private Class<?> clazz;
    public BaseDaoImpl(){}
    protected void setClass(Class<?> clazz){
        this.clazz = clazz;
    }

    @Autowired
    public void setFactory(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

    @Transactional
    public void insert(T t) {
        /*Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();*/
        /*Transaction transaction = session.beginTransaction();*/
        try{
            super.getHibernateTemplate().save(t);
        }catch(Exception e){e.printStackTrace();}
        /*transaction.commit();*/
    }
    @Transactional
    @Override
    public List<?> queryAll() {

        Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
        /*Transaction tx = session.beginTransaction();*/
        Query query = session.createQuery("from "+this.clazz.getName());
        List<?> result = query.list();
       /* tx.commit();*/
        return result;
    }

    @Override
    public T queryObject(String id) {
        Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
        /*Transaction tx = session.beginTransaction();*/
        T t = (T)this.getHibernateTemplate().get(clazz,id);
        /*tx.commit();*/
        return t;
    }
}
