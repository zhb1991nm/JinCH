package com.jinch.foreground.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by 敏华 on 2014/7/29.
 */
@Controller
public class LoginController {
    /**
     * get方式打开login.jsp，即通过链接打开
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    /**
     * 提交表单登录
     * 问题，不知道为什么无法得到@PathVariable("username") Stri
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "/login" , method = RequestMethod.POST) //@RequestMapping("/login1/{username}")
    public String login1(PrintWriter out,HttpServletRequest request, HttpServletResponse response, HttpSession session,@RequestParam("username") String username,@RequestParam("password") String password){//
        System.out.println("hello,"+request.getParameter("username")+":name:"+username+":password:"+password+" welcome login.");
        return "index";
        //下面两个要一起，return null
//        out.println("hello:"+request.getParameter("username"));
//        return null;
    }

    /**
     * 测试参数传递
     * @param param1
     * @return
     */
    @RequestMapping(value="/testParam")
    public String testParam(String param1,Map model){

        model.put("param1",param1);//将参数传递到jsp，在页面中通过EL表达式  ${param1}获取对象即可
        System.out.println("testParam:"+param1);
        return "index";
    }
}