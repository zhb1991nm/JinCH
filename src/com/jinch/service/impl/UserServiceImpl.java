package com.jinch.service.impl;

import com.jinch.Dao.IUserDao;
import com.jinch.entity.User;
import com.jinch.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Hua on 2014/7/30.
 */
@Service
public class UserServiceImpl implements IUserService{
    @Autowired
    private IUserDao userDao;
    @Override
    public String checkUserLogin(String username, String password) {
        User userInfo = (User) userDao.queryObject("1");
        String result = "";
        if(userInfo != null){
            System.out.println("userinfo size----->"+userInfo.getLoginName());
            result = "login name is"+userInfo.getLoginName();
        }else{
            result = "empty";
        }
        return result;
    }
}
