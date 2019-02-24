package com.fukai.installment.controller;

import com.fukai.installment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.testng.annotations.Test;


@Controller
public class UserControllerTest {
    @Autowired
    private UserController userController;
    @Autowired
    private UserService userService;
    @Test
    public void testAddUser() throws Exception {

    }

    @Test
    public void testQueryUserList() throws Exception {
        userController.queryUserList();
    }

    @Test
    public void testQueryInstallmentList() {
    }
}