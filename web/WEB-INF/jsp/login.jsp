<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <base href="<%=basePath%>">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="http://x.autoimg.cn/m/style/public-v6.css" rel="stylesheet" type="text/css" />
    <link href="http://x.autoimg.cn/account/content/mlogin.css?v=2014-08-01" rel="stylesheet" type="text/css" />
    <script src="login.js" type="text/javascript"></script>

    <title>login</title>
</head>
<body>
<input type="hidden" value="<%= basePath%>" id="path"/>
<div class="nav">
    <h2 class="nav-title">登录</h2>
    <a href="javascript:window.history.go(-1);" class="nav-back"><i class="icon-arrow arrow-left"></i><span id="btnBack">返回</span></a>
    <div style="position:absolute; top:6px; right:10px;"><a href="/Register?rt=0&seriesid=0&backurl=http%3a%2f%2fm.autohome.com.cn%2f" class="btn btn-small-blue" >注册</a></div>
</div>
<div class="main">
    <s:form action="/JinCH/login.do" method="post" id="loginForm">
    <div class="fn-mt fn-mlr" id="ToolTipDiv" style=" display:none;"><span class="tip01 tip01-warn" id="ToolTip"></span></div>
    <div class="login-enter">
        <div class="item noa">
            <div class="form-text-box" id="txtUserNameDiv">
                <input type="text" id="txtUserName" placeholder="手机号/邮箱/用户名" class="form-text" />
                <a href="#" class="form-text-clear fn-hide" id="txtUserNameA"><i class="icon icon-clear"></i></a>
            </div>
        </div>
        <div class="item nob">
            <div class="form-text-box" id="txtPwdDiv">
                <input type="password" placeholder="输入密码" class="form-text" id="txtPwd" />
                <a href="#" class="form-text-clear fn-hide" id="txtPwdA"><i class="icon icon-clear"></i></a>
            </div>
        </div>
    </div>
    <div class="fn-mt-login fn-mlr"><a href='javascript:login();' class="btn btn-bar-blue" id="btnLogin" >登录</a></div>
    </s:form>
</div>
<script src="http://x.autoimg.cn/account/Scripts/autozepto-0.1.2.js?v=2014-08-01" type="text/javascript"></script>

<script type="text/javascript">
function login1(){
    document.getElementById("loginForm").submit();
}
var loginPageInfo = {
    userName: $("#txtUserName"),
    pwd: $("#txtPwd"),
    userNameDiv: $("#txtUserNameDiv"),
    pwdDiv: $("#txtPwdDiv"),
    userNameA: $("#txtUserNameA"),
    pwdA: $("#txtPwdA"),
    btnLogin: $("#btnLogin"),
    loadIng: $("#spanLoadingLayer"),
    toolTip: $("#ToolTip"),
    toolTipDiv: $("#ToolTipDiv"),
    backUrl: "http://m.autohome.com.cn/",
    goBackBtn: $("#btnBack"),
    Init: function () {
        var self = this;
        self.userName.on("focus", function () {
            self.bind(self.userNameFocus, self)();
        });
        self.userName.on("blur", function () {
            self.bind(self.userNameBlur, self)();
        });
        self.userName.on("keyup", function () {
            self.userNameDiv.attr("class", 'form-text-box form-text-focus form-text-hadin');
            if (self.userName.val() == '') {
                self.userNameA.attr("class", 'form-text-clear fn-hide');
            } else {
                self.userNameA.attr("class", 'form-text-clear');
            }
        });
        self.pwd.on("focus", function () {
            self.bind(self.pwdFocus, self)();
        });
        self.pwd.on("blur", function () {
            self.bind(self.pwdBlur, self)();
        });
        self.pwd.on("keyup", function () {
            self.pwdDiv.attr("class", 'form-text-box form-text-focus form-text-hadin');
            if (self.pwd.val() == '') {
                self.pwdA.attr("class", 'form-text-clear fn-hide');
            } else {
                self.pwdA.attr("class", 'form-text-clear');
            }
        });
        self.btnLogin.on("click", function () {
            self.bind(self.submitClick, self)();
        });
        self.goBackBtn.on("click", function () {
            window.location.href = self.backUrl.indexOf("http://i.m.autohome.com.cn") >= 0 ? "http://m.autohome.com.cn/" : self.backUrl;
        });
        self.userNameA.on("click", function () {
            self.userName.val('');
            self.userNameA.attr("class", 'form-text-clear fn-hide');
            self.userName.focus();
            self.userNameDiv.attr("class", 'form-text-box form-text-focus form-text-hadin');
        });
        self.pwdA.on("click", function () {
            self.pwd.val('');
            self.pwdA.attr("class", 'form-text-clear fn-hide');
            self.pwd.focus();
            self.pwdDiv.attr("class", 'form-text-box form-text-focus form-text-hadin');
        });
    },
    userNameFocus: function () {
        var self = this;
        self.userNameDiv.addClass('form-text-focus form-text-hadin');
        if (self.userName.val() == '') {
            self.userNameA.attr("class", 'form-text-clear fn-hide');
        } else {
            self.userNameA.attr("class", 'form-text-clear');
        }
    },
    userNameBlur: function () {
        var self = this;
        if (self.userName.val() == '') {
            if (self.userNameDiv.attr("class") != "form-text-box form-text-focus form-text-hadin form-text-error") {
                self.userNameDiv.attr("class", 'form-text-box');
            }
            self.userNameA.attr("class", 'form-text-clear fn-hide');
        } else {
            self.userNameDiv.attr("class", 'form-text-box form-text-hadin');
            self.userNameA.attr("class", 'form-text-clear');
        }
    },
    pwdFocus: function () {
        var self = this;
        self.pwdDiv.addClass('form-text-focus form-text-hadin');
        if (self.pwd.val() != '') {
            self.pwdA.attr("class", 'form-text-clear');
        } else {
            self.pwdA.attr("class", 'form-text-clear fn-hide');
        }
    },
    pwdBlur: function () {
        var self = this;
        if (self.pwd.val() == '') {
            if (self.pwdDiv.attr("class") != "form-text-box form-text-focus form-text-hadin form-text-error") {
                self.pwdDiv.attr("class", 'form-text-box');
            }
            self.pwdA.attr("class", 'form-text-clear fn-hide');
        } else {
            self.pwdDiv.attr("class", 'form-text-box form-text-hadin');
            self.pwdA.attr("class", 'form-text-clear');
        }
    },
    submitClick: function () {
        var self = this;
        url = '';
        self.toolTip.html('');
        self.toolTipDiv.css('display', 'none');
        if (self.userName.val() == "") {
            self.toolTip.html('<i class="icon-tip icon-warn"></i>请输入用户名');
            self.userName.focus();
            self.userNameDiv.attr("class", 'form-text-box form-text-focus form-text-hadin form-text-error');
            self.toolTipDiv.css('display', 'block');
            return;
        }
        if (self.pwd.val() == "") {
            self.toolTip.html('<i class="icon-tip icon-warn"></i>请输入密码');
            self.pwd.focus();
            self.pwdDiv.attr("class", 'form-text-box form-text-focus form-text-hadin form-text-error');
            self.toolTipDiv.css('display', 'block');
            return;
        }
        self.setControlDisabled();
//        $.post("/Login/MobileLogin", { name: encodeURIComponent(self.userName.val()), pwd: self.pwd.val(), validcode: self.code.val(), appid: 'm', djax: (new Date()).getTime() }, function (data) {
//            self.setControlUnDisabled();
//            if (!data) {
//                self.setControlUnDisabled();
//                self.toolTip.html('<i class="icon-tip icon-warn"></i>登录失败');
//                self.loadCountIp();
//                self.toolTipDiv.css('display', 'block');
//                return;
//            }
//            if (data.body.success == 0) {
//                self.toolTip.html('<i class="icon-tip icon-warn"></i>' + data.body.message);
//                self.loadCountIp();
//                if (data.body.message == '验证码不正确！') {
//                    self.codeDiv.attr("class", 'form-text-box form-text-focus form-text-hadin form-text-error');
//                    self.pwdDiv.attr("class", 'form-text-box form-text-hadin');
//                } else {
//                    self.pwdDiv.attr("class", 'form-text-box form-text-focus form-text-hadin form-text-error');
//                }
//                self.toolTipDiv.css('display', 'block');
//                return;
//            }
//            else if (data.body.success == 1) {
//
//                self.toolTip.attr("class", "tip01 tip01-ok");
//                self.toolTip.html('<i class="icon-tip icon-ok"></i>登录成功');
//                self.toolTipDiv.css('display', 'block');
//                self.JLoad(data.body.auUrl, self.backUrl);                     ;
//            }
//            else {
//                self.toolTip.html('<i class="icon-tip icon-warn"></i>非法登录');
//                self.toolTipDiv.css('display', 'block');
//            }
//        }, "json");
    },

    setControlDisabled: function () {
        var self = this;
        self.loadIng.show();
        self.userName.attr('disabled', true);
        self.pwd.attr('disabled', true);
        self.code.attr('disabled', true);
        self.btnLogin.attr('disabled', true);
    },
    setControlUnDisabled: function () {
        var self = this;
        self.loadIng.hide();
        self.userName.removeAttr('disabled');
        self.pwd.removeAttr('disabled');
        self.code.removeAttr('disabled');
        self.btnLogin.removeAttr('disabled');
    },
    bind: function (fn, obj, arg) {
        arg = arg || [];
        return function () {
            fn.apply(obj, arg.concat(arguments));
        }
    }
}
loginPageInfo.Init();
</script>



<%--<table>--%>
    <%--<tr>--%>
        <%--<td>--%>
            <%--<form action="/login.do" method="post">--%>
                <%--<tr>--%>
                    <%--<th>--%>
                        <%--用户名&nbsp;--%>
                    <%--</th>--%>
                    <%--<td>--%>
                        <%--<input type="text" name="username" id="username">--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<th>--%>
                        <%--密码&nbsp;--%>
                    <%--</th>--%>
                    <%--<td>--%>
                        <%--<input type="text" name="password" id="password">--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td colspan="2" align="center">--%>
                        <%--<input type="submit" value="登录">--%>
                    <%--</td>--%>
                <%--</tr>--%>


            <%--</form>--%>
        <%--</td>--%>
    <%--</tr>--%>
    <%--<tr>--%>
        <%--<td>--%>
            <%--<form action="/testParam.do" method="post">--%>
                <%--参数：<input type="text" name="param1" id="param1">--%>
                <%--<input type="submit" value="参数传递测试">--%>

            <%--</form>--%>
        <%--</td>--%>
    <%--</tr>--%>
<%--</table>--%>
</body>
</html>
