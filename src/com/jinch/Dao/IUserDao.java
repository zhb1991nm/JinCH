package com.jinch.Dao;

import com.jinch.entity.User;

/**
 * Created by Hua on 2014/7/30.
 */
public interface IUserDao extends IBaseDao<User,String>{

    public String checkUserLogin(String username,String password);


}
