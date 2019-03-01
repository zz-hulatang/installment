package com.fukai.installment.controller;

import com.fukai.installment.bean.User;
import com.fukai.installment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-28 18:08
 */
@Component
public class Jobs {

    @Autowired
    private UserService userService;

    /**
     *
     * 每天0点执行
     * @return
     * @author luoxiaozhu
     * @date 2019-02-28 18:13
     */
    @Scheduled(cron = "0 0 1 * * ?")
    public void repayStateJob(){
        userService.repayStateJob();
    }

}
