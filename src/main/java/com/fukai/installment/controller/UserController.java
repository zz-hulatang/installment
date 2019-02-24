package com.fukai.installment.controller;

import com.fukai.installment.bean.InstallmentEntity;
import com.fukai.installment.bean.User;
import com.fukai.installment.service.UserService;
import com.fukai.installment.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 21:51
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void addUser(@RequestBody User user,@RequestBody InstallmentEntity installmentEntity) throws Exception{
        String id = UUID.randomUUID().toString();
        user.setId(id);
        String id1 = UUID.randomUUID().toString();
        installmentEntity.setId(id1);
        userService.save(user,installmentEntity);
    }

}
