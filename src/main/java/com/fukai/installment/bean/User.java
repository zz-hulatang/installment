package com.fukai.installment.bean;

import javax.persistence.*;
import java.util.Date;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 22:47
 */
@Entity
@Table(name = "user")
public class User {
    @Id
    private String id;
    private String IDcard;
    private String name;
    private String password;
    private String mobilephone;
    private Date createTime;

    @Transient
    private InstallmentEntity installmentEntity;

    public InstallmentEntity getInstallmentEntity() {
        return installmentEntity;
    }

    public void setInstallmentEntity(InstallmentEntity installmentEntity) {
        this.installmentEntity = installmentEntity;
    }

    public String getIDcard() {
        return IDcard;
    }

    public void setIDcard(String IDcard) {
        this.IDcard = IDcard;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
