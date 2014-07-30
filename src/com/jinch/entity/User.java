package com.jinch.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by 敏华 on 2014/7/30.
 */
@Entity
@Table(name="tb_user")
public class User extends BaseEntity{
    @Column(name="real_name",length = 20)
    private String realName;

    @Column(name="login_name",length = 20)
    private String loginName;

    @Column(name="password",length = 20)
    private String password;

    @Column(name="phone_number",length = 20)
    private String phoneNumber;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }
}
