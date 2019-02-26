package com.fukai.installment.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @Author: niul
 * @Date: 2019-02-23
 */
@Entity
@Table(name = "installment")
public class InstallmentEntity {
    @Id
    private String id;
    private String userId;
    private double installmentAmount; // 贷款本金
    private double interestRate;// 执行利率
    private int repayNumber; // 还款期数
    private String repayCardNumber; // 还款卡号
    private Date repayDate;// 首次还款日期
    private String profileNumber; // 档案号
    private int repayType; // 还款方式

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public double getInstallmentAmount() {
        return installmentAmount;
    }

    public void setInstallmentAmount(double installmentAmount) {
        this.installmentAmount = installmentAmount;
    }

    public double getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(double interestRate) {
        this.interestRate = interestRate;
    }

    public int getRepayNumber() {
        return repayNumber;
    }

    public void setRepayNumber(int repayNumber) {
        this.repayNumber = repayNumber;
    }

    public String getRepayCardNumber() {
        return repayCardNumber;
    }

    public void setRepayCardNumber(String repayCardNumber) {
        this.repayCardNumber = repayCardNumber;
    }

    public Date getRepayDate() {
        return repayDate;
    }

    public void setRepayDate(Date repayDate) {
        this.repayDate = repayDate;
    }

    public String getProfileNumber() {
        return profileNumber;
    }

    public void setProfileNumber(String profileNumber) {
        this.profileNumber = profileNumber;
    }

    public int getRepayType() {
        return repayType;
    }

    public void setRepayType(int repayType) {
        this.repayType = repayType;
    }
}
