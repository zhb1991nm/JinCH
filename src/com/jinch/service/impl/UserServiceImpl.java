package com.jinch.service.impl;

import com.jinch.Dao.IUserDao;
import com.jinch.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Hua on 2014/7/30.
 */
@Service
public class UserServiceImpl implements IUserService{
    @Autowired
    private IUserDao userDao;
    @Override
    public String checkUserLogin(String username, String password) {
        return userDao.checkUserLogin(username,password);
    }
}
