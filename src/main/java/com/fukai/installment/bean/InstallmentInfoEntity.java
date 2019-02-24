package com.fukai.installment.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * @Author: niul
 * @Date: 2019-02-23
 */
@Entity
@Table(name = "installmentInfo")
public class InstallmentInfoEntity {
    @Id
    private String id;
    private String installId;
    private String repayState; // 还款状态（0未还1已还）
    private double repayAmount;// 还款金额
    private int repayDate; // 还款期数
    private Date repayTime;// 还款时间

    @Transient
    private String repayTime1;

    public String getId() {
        return id;
    }

    public String getInstallId() {
        return installId;
    }

    public void setInstallId(String installId) {
        this.installId = installId;
    }

    public String getRepayState() {
        return repayState;
    }

    public void setRepayState(String repayState) {
        this.repayState = repayState;
    }

    public double getRepayAmount() {
        return repayAmount;
    }

    public void setRepayAmount(double repayAmount) {
        this.repayAmount = repayAmount;
    }

    public int getRepayDate() {
        return repayDate;
    }

    public void setRepayDate(int repayDate) {
        this.repayDate = repayDate;
    }

    public Date getRepayTime() {
        return repayTime;
    }

    public void setRepayTime(Date repayTime) {
        this.repayTime = repayTime;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRepayTime1() {
        return repayTime1;
    }

    public void setRepayTime1(String repayTime1) {
        this.repayTime1 = repayTime1;
    }
}
