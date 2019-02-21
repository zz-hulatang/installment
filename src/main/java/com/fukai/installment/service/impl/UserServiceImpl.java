package com.fukai.installment.service.impl;

import com.fukai.installment.bean.User;
import com.fukai.installment.dao.UserRepository;
import com.fukai.installment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 22:52
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }
}
