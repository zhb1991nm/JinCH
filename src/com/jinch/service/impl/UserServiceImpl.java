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
        String result = "123";
       /* User user = new User();
        user.setDataId("121212");
        user.setLoginName("yang");
        userDao.insert(user);*/
      //  User userInfo = (User) userDao.queryObject("1");
        List<User> userList = (List<User>) userDao.queryAll();

        if( userList != null){
            result = "login name is   total:"+userList.size()+" users";
        }else{
            result = "empty";
        }
        System.out.println(result);
        return result;
    }
}
