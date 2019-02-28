package com.fukai.installment.service.impl;

import com.fukai.installment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

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
    @Scheduled(cron = "0 0 0 * * ?")
    public void repayStateJob(){
        userService.repayStateJob();
    }

}
