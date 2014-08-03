<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: 敏华
  Date: 2014/7/29
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="http://x.autoimg.cn/m/style/public-v6.css" rel="stylesheet" type="text/css"/>
    <link href="http://x.autoimg.cn/account/content/mlogin.css?v=2014-08-01" rel="stylesheet" type="text/css"/>
    <script src="resources/script/jquery-1.11.1.min.js" type="text/javascript"></script>

    <title>login</title>
</head>
<body>

<div class="nav">
    <h2 class="nav-title">登录</h2>
    <a href="javascript:window.history.go(-1);" class="nav-back"><i class="icon-arrow arrow-left"></i><span
            id="btnBack">返回</span></a>

    <div style="position:absolute; top:6px; right:10px;"><a
            href="/Register?rt=0&seriesid=0&backurl=http%3a%2f%2fm.autohome.com.cn%2f" class="btn btn-small-blue">注册</a>
    </div>
</div>
<div class="main">

    <s:form action="/JinCH/login.do" method="post" id="loginForm">
        <div class="fn-mt fn-mlr" id="ToolTipDiv" style=" display:none;"><span class="tip01 tip01-warn"
                                                                               id="ToolTip"></span></div>
        <div class="login-enter">
            <div class="item noa">
                <div class="form-text-box" id="txtUserNameDiv">
                    <input type="text" id="txtUserName" name="txtUserName" placeholder="手机号/邮箱/用户名" class="form-text"/>
                    <a href="#" class="form-text-clear fn-hide" id="txtUserNameA"><i class="icon icon-clear"></i></a>
                </div>
            </div>
            <div class="item nob">
                <div class="form-text-box" id="txtPwdDiv">
                    <input type="password" placeholder="输入密码" class="form-text" id="txtPwd" name="txtPwd"/>
                    <a href="#" class="form-text-clear fn-hide" id="txtPwdA"><i class="icon icon-clear"></i></a>
                </div>
            </div>
        </div>
        <div class="fn-mt-login fn-mlr"><a href='javascript:login();' class="btn btn-bar-blue" id="btnLogin">登录</a>
        </div>
    </s:form>
</div>
<script src="http://x.autoimg.cn/account/Scripts/autozepto-0.1.2.js?v=2014-08-01" type="text/javascript"></script>
<script src="resources/script/login.js" type="text/javascript"></script>
<script type="text/javascript">

</script>


</body>
</html>
