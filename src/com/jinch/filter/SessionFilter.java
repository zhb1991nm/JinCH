package com.jinch.filter;


import javax.servlet.*;
import java.io.IOException;

/**
 * Created by 敏华 on 2014/8/5.
 * session 过滤器
 * web.xml中匹配是全部，所以不要要对登录页进行过滤，否则会死循环
 */
public class SessionFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
