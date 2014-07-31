package com.jinch.Dao;

import java.util.List;

/**
 * Created by 敏华 on 2014/7/31.
 */
public interface IBaseDao<T,ID> {
    List<?> queryAll();
    T queryObject(String id);
}
