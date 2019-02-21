package com.fukai.installment.controller;

import com.fukai.installment.bean.User;
import com.fukai.installment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 21:51
 */
@Controller
public class TestController {

    @Autowired
    private UserService userService;

    @RequestMapping("/test")
    @ResponseBody
    public Map test(){
        Map map = new HashMap();
        map.put("test","aaa");
        return map;
    }
}
