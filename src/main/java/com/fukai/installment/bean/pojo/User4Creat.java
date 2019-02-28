package com.fukai.installment.bean.pojo;

import java.util.Date;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-25 19:58
 */
public class User4Creat {
    private String idCard;
    private String name;
    private String mobilePhone;
    private double installmentAmount; // 贷款本金
    private double interestRate;// 执行利率
    private int repayNumber; // 还款期数
    private String repayCardNumber; // 还款卡号
    private Date repayDate;// 首次还款日期
    private String profileNumber; // 档案号
    private int repayType; // 还款方式
    private String userId;
    private String installmentEntityId;

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getInstallmentEntityId() {
        return installmentEntityId;
    }

    public void setInstallmentEntityId(String installmentEntityId) {
        this.installmentEntityId = installmentEntityId;
    }
}
