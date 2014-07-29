package com.jinch.foreground.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 敏华 on 2014/7/29.
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login(){
        System.out.println("login");
        return "index";
    }
}
