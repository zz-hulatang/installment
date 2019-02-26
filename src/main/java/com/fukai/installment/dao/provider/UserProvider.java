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
        sql.append("select a.mobilePhone,a.idCard,b.installmentAmount,b.id installmentEntityId from user a " +
                "left join installment b on a.id=b.userId ");
        if(StringUtils.isNotBlank((String) map.get("keyWord"))){
            sql.append(" where a.mobilePhone like CONCAT('%',#{keyWord},'%') " +
                    "or a.idCard like CONCAT('%',#{keyWord},'%') ");
        }
        sql.append(" order by a.createTime asc limit #{page},#{size}");
        return sql.toString();
    }

    public static String selectUserListCount(String keyWord){
        StringBuilder sql = new StringBuilder();
        sql.append("select count(1) from user a " +
                "left join installment b on a.id=b.userId ");
        if(StringUtils.isNotBlank(keyWord)){
            sql.append(" where a.mobilePhone like CONCAT('%',#{keyWord},'%') " +
                    "or a.idCard like CONCAT('%',#{keyWord},'%') ");
        }
        return sql.toString();
    }
}
