package com.fukai.installment.dao.provider;

import org.apache.commons.lang.StringUtils;

import java.util.Map;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-26 19:09
 */
public class UserProvider {
    public static String getUserList(Map<String,Object> map){
        StringBuilder sql = new StringBuilder();
        sql.append("select a.name,a.mobilePhone,a.idCard,b.installmentAmount,b.id installmentEntityId,b.interestRate from user a " +
                "right join installment b on a.id=b.userId ");
        if(StringUtils.isNotBlank((String) map.get("keyWord"))){
            sql.append(" where a.mobilePhone like CONCAT('%',#{keyWord},'%') " +
                    "or a.idCard like CONCAT('%',#{keyWord},'%') " +
                    "or a.idCard like CONCAT('%',#{keyWord},'%') " +
                    "or b.repayCardNumber like CONCAT('%',#{keyWord},'%') " +
                    "or b.profileNumber like CONCAT('%',#{keyWord},'%') ");
        }
        sql.append(" order by a.createTime desc limit #{page},#{size}");
        return sql.toString();
    }

    public static String selectUserListCount(String keyWord){
        StringBuilder sql = new StringBuilder();
        sql.append("select count(1) from user a " +
                "right join installment b on a.id=b.userId ");
        if(StringUtils.isNotBlank(keyWord)){
            sql.append(" where a.mobilePhone like CONCAT('%',#{keyWord},'%') " +
                    "or a.idCard like CONCAT('%',#{keyWord},'%') ");
        }
        return sql.toString();
    }
}
