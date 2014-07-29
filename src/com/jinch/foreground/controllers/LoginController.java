package com.jinch.foreground.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by 敏华 on 2014/7/29.
 */
@Controller
public class LoginController {

    /**
     * get方式打开login.jsp
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    /**
     * 提交表单登录
     * 问题，不知道为什么无法得到@PathVariable("username") Stri
//     * @param username
//     * @param password
     * @return
     */
    @RequestMapping(value = "/login" , method = RequestMethod.POST) //@RequestMapping("/login1/{username}")
    public String login1(PrintWriter out,HttpServletRequest request, HttpServletResponse response, HttpSession session){//@PathVariable("username") String username,@PathVariable("password") String password
        System.out.println("hello,"+request.getParameter("username")+" welcome login.");
        return "index";
        //下面两个要一起，return null
//        out.println("hello:"+request.getParameter("username"));
//        return null;
    }

}
