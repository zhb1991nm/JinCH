package com.jinch.Dao.impl;

import com.jinch.Dao.IUserDao;
import com.jinch.entity.User;
import org.springframework.stereotype.Repository;

/**
 * Created by Hua on 2014/7/30.
 */
@Repository
public class UserDaoImpl extends BaseDaoImpl<User,String> implements IUserDao{
    public UserDaoImpl(){
        this.setClass(User.class);
    }
    @Override
    public String checkUserLogin(String username, String password) {
        return "message from userdao";
    }
}
