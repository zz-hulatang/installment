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
    private String idCard;
    private String name;
    private String password;
    private String mobilePhone;
    private Date createTime;
    private String userType;//用户类型 0普通用户 1管理员

    @Transient
    private InstallmentEntity installmentEntity;
    @Transient
    private long count;//user数据总量

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public InstallmentEntity getInstallmentEntity() {
        return installmentEntity;
    }

    public void setInstallmentEntity(InstallmentEntity installmentEntity) {
        this.installmentEntity = installmentEntity;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
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
