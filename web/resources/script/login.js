/**
 * Created by 敏华 on 2014/8/3.
 */
$(document).ready(function() {

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
        backUrl: "login.jsp",
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
        $.post("/JinCH/login.do", { username: encodeURIComponent(self.userName.val()), pwd: self.pwd.val(), appid: 'm', djax: (new Date()).getTime() }, function (data) {
            //self.setControlUnDisabled();
            alert(data);
            if (!data) {
                self.setControlUnDisabled();
                self.toolTip.html('<i class="icon-tip icon-warn"></i>登录失败');
                self.loadCountIp();
                self.toolTipDiv.css('display', 'block');
                return;
            }
            if (data.success == 0) {
                self.toolTip.html('<i class="icon-tip icon-warn"></i>' + data.body.message);
                self.loadCountIp();
                if (data.body.message == '验证码不正确！') {
                    self.codeDiv.attr("class", 'form-text-box form-text-focus form-text-hadin form-text-error');
                    self.pwdDiv.attr("class", 'form-text-box form-text-hadin');
                } else {
                    self.pwdDiv.attr("class", 'form-text-box form-text-focus form-text-hadin form-text-error');
                }
                self.toolTipDiv.css('display', 'block');
                return;
            }
            else if (data.success == 1) {

                self.toolTip.attr("class", "tip01 tip01-ok");
                self.toolTip.html('<i class="icon-tip icon-ok"></i>登录成功');
                self.toolTipDiv.css('display', 'block');
                window.location.href = data.auUrl;                     ;
            }
            else {
                self.toolTip.html('<i class="icon-tip icon-warn"></i>非法登录');
                self.toolTipDiv.css('display', 'block');
            }
        }, "json");
        },

        setControlDisabled: function () {
            var self = this;
            self.loadIng.show();
            self.userName.attr('disabled', true);
            self.pwd.attr('disabled', true);
//            self.code.attr('disabled', true);
            self.btnLogin.attr('disabled', true);
        },
        setControlUnDisabled: function () {
            var self = this;
            self.loadIng.hide();
            self.userName.removeAttr('disabled');
            self.pwd.removeAttr('disabled');
//            self.code.removeAttr('disabled');
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

});

function login(){

   // $("#loginForm").submit();
}


