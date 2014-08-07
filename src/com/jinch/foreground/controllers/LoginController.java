package com.jinch.foreground.controllers;

import com.jinch.service.IUserService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by 敏华 on 2014/7/29.
 */
@Controller
public class LoginController {
    @Autowired
    private IUserService userService;
    /**
     * get方式打开login.jsp，即通过链接打开
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
       // String t = userService.checkUserLogin("hua","1212");
        return "login";
    }

    /**
     * 提交表单登录
     * @param username
     * @param pwd
     * @return
     */
    @RequestMapping(value = "/login" , method = RequestMethod.POST) //@RequestMapping("/login1/{username}")
    public void login1(PrintWriter out,HttpServletRequest request, HttpServletResponse response, HttpSession session,@RequestParam("username") String username,@RequestParam("pwd") String pwd,Map dataMap){//
        System.out.println("hello,:name:"+username+":password:"+pwd+" welcome login.");

        String t = "test";//userService.checkUserLogin(username,password);
        dataMap.put("param1", username);
        dataMap.put("msg",t);
        dataMap.put("success","1");

        JSONObject obj = new JSONObject();
        obj.put("success","1");
        obj.put("auUrl","product.do");//跳转地址


        String json = "{body:[{'success':'1','name':'Bill Gates','street':'Fifth Avenue New York 666','age':56,'phone':'555 1234567'}]}";
        response.setCharacterEncoding("utf-8");
        try {
            response.getWriter().write(obj.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        //return null;//"product";
        //下面两个要一起，return null
//        out.println("hello:"+request.getParameter("username"));
//        return null;
    }

    @RequestMapping(value="/product")
    public String goToProduct(String param1,Map model){

        System.out.println("testParam:"+param1);
        return "product";
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
