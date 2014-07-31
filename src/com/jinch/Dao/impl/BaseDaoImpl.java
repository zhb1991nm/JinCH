package com.jinch.Dao.impl;

import com.jinch.Dao.IBaseDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

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

    @Override
    public List<?> queryAll() {
        Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
        Query query = session.createQuery("from "+this.clazz.getName());
        return query.list();
    }

    @Override
    public T queryObject(String id) {
        return (T)this.getHibernateTemplate().get(clazz,id);
    }
}
