package com.jinch.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * Created by 敏华 on 2014/7/30.
 */
@Entity
@Table(name="tb_user")
public class User implements Serializable{
    @Id
    @Column(name="dataId",length=32)
    protected String dataId;

    @Column(name="realName",length = 20)
    private String realName;

    @Column(name="loginName",length = 20)
    private String loginName;

    @Column(name="password",length = 20)
    private String password;

    @Column(name="phoneNumber",length = 20)
    private String phoneNumber;

    public String getDataId() {
        return dataId;
    }

    public void setDataId(String dataId) {
        this.dataId = dataId;
    }

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
