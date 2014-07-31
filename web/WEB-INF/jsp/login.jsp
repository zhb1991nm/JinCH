<%--
  Created by IntelliJ IDEA.
  User: 敏华
  Date: 2014/7/29
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%--<link href="http://x.autoimg.cn/m/style/public-v6.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../css/public.css" rel="stylesheet" type="text/css"/>--%>
    <%--<link href="http://x.autoimg.cn/account/content/mlogin.css?v=2014-07-25" rel="stylesheet" type="text/css" />--%>

    <title>login</title>
    <style>
        .nav {
            z-index: 999;
            background: #3b5998;
            position: relative;
        }

        .nav-title {
            height: 20px;
            padding: 10px 0;
            font-size: 18px;
            color: #fff;
            line-height: 20px;
            text-align: center;
        }

        .nav-back {
            display: inline-block;
            height: 26px;
            padding: 7px 0 7px 6px;
            color: #fff;
            position: absolute;
            top: 0;
            left: 0;
            overflow: hidden;
        }

        .icon-arrow {
            background: url(http://x.autoimg.cn/m/news/images/bg-arrow-v1111.png) no-repeat;
            background-size: 80px auto;
        }

        .arrow-left {
            float: left;
            width: 12px;
            height: 26px;
            background-position: -60px -40px;
        }

        .btn {
            display: inline-block;
            border: solid #d0d6e1 1px;
            background: #f5f6f9;
            color: #4e5563;
            line-height: 18px;
            white-space: nowrap;
            border-radius: 3px;
        }

        .btn-small-blue {
            border-color: #5f7dbe;
            background: #5f7dbe;
            color: #fff;
        }

        .main {
            min-height: 400px;
        }

        .fn-mt {
            margin-top: 8px;
        }

        .fn-mlr {
            margin-left: 10px;
            margin-right: 10px;
        }

        .tip01 {
            display: inline-block;
            font-size: 16px;
            color: #4e5563;
            line-height: 19px;
        }

        .tip01-warn {
            color: #fe6600;
        }

        .login-enter {
            padding: 0 10px;
        }

        .login-enter .item {
            margin: 14px 0 0;
            position: relative;
        }

        .form-text-box {
            position: relative;
            height: 32px;
            padding: 0 4px;
            border: solid #d0d6e1 1px;
            background: #f5f6f9;
            border-radius: 3px;
        }

        .form-text {
            width: 100%;
            height: 18px;
            padding: 7px 0;
            background: none;
            border: none;
            outline: none;
            font-size: 16px;
            color: #4e5563;
            line-height: 18px;
            overflow: hidden;
        }

        .form-text-clear {
            width: 18px;
            height: 18px;
            padding: 7px 8px;
            position: absolute;
            top: 0;
            right: 0;
            margin-left: -32px;
            overflow: hidden;
        }

        .icon {
            background: url(http://x.autoimg.cn/m/news/images/bg-icon-v0303.png) no-repeat;
            background-size: 160px auto;
        }

        .form-text-clear .icon-clear {
            display: inline-block;
            width: 18px;
            height: 18px;
            background-position: -20px -20px;
            vertical-align: top;
        }

        .fn-hide {
            display: none;
        }

        .btn-bar-blue {
            display: block;
            padding: 7px 0;
            border-color: #5f7dbe;
            background: #5f7dbe;
            font-size: 16px;
            color: #fff;
            text-align: center;
        }

        .fn-mt-login {
            margin-top: 14px;
        }

        .fn-mlr {
            margin-left: 10px;
            margin-right: 10px;
        }

        .fn-tright {
            text-align: right;
        }
    </style>
</head>
<body>
<%--<div class>
</div>
<div class="nav">
    <h2 class="nav-title">登录</h2>
    <a href="javascript:window.history.go(-1);" class="nav-back"><i class="icon-arrow arrow-left"></i><span
            id="btnBack">返回</span></a>

    <div style="position:absolute; top:6px; right:10px;"><a
            href="/Register?rt=0&seriesid=0&backurl=http%3a%2f%2fm.autohome.com.cn%2f" class="btn btn-small-blue">注册</a>
    </div>
</div>
<div class="main">
    <div class="fn-mt fn-mlr" id="ToolTipDiv" style=" display:none;"><span class="tip01 tip01-warn" id="ToolTip"></span>
    </div>
    <div class="login-enter">
        <form action="/JinCH/login.do" method="post">
        <div class="item noa">
            <div class="form-text-box" id="txtUserNameDiv">
                <input type="text" id="username" name="username" placeholder="手机号/邮箱/用户名" class="form-text"/>
                <a href="#" class="form-text-clear fn-hide" id="txtUserNameA"><i class="icon icon-clear"></i></a>
            </div>
        </div>
        <div class="item nob">
            <div class="form-text-box" id="txtPwdDiv">
                <input type="password" placeholder="输入密码" class="form-text" id="password" name="password"/>
                <a href="#" class="form-text-clear fn-hide" id="txtPwdA"><i class="icon icon-clear"></i></a>
            </div>
        </div>
            </form>
    </div>
    <div class="fn-mt-login fn-mlr"><a href="javascript:void(0);" class="btn btn-bar-blue" id="btnLogin">登录</a></div>
    </div>
</div>--%>


<table>
    <tr>
        <td>
            <form action="/login.do" method="post">
                <tr>
                    <th>
                        用户名&nbsp;
                    </th>
                    <td>
                        <input type="text" name="username" id="username">
                    </td>
                </tr>
                <tr>
                    <th>
                        密码&nbsp;
                    </th>
                    <td>
                        <input type="text" name="password" id="password">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="登录">
                    </td>
                </tr>


            </form>
        </td>
    </tr>
    <tr>
        <td>
            <form action="/testParam.do" method="post">
                参数：<input type="text" name="param1" id="param1">
                <input type="submit" value="参数传递测试">

            </form>
        </td>
    </tr>
</table>
</body>
</html>
