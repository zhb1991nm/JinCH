package com.jinch.Dao.impl;

import com.jinch.Dao.IUserDao;
import org.springframework.stereotype.Repository;

/**
 * Created by Hua on 2014/7/30.
 */
@Repository
public class UserDaoImpl implements IUserDao{
    @Override
    public String checkUserLogin(String username, String password) {
        return "message from userdao";
    }
}
