package com.desensitization.service.login.impl;

import com.desensitization.mapper.login.loginMapper;
import com.desensitization.model.login.User;
import com.desensitization.service.login.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:56
 */
@Service
public class loginServiceImpl implements loginService {
    @Autowired
    loginMapper loginMapper;

    @Override
    public User getUserInfoByName(String name) {
        return loginMapper.getUserInfoByName(name);
    }

    @Override
    public Integer addUser(User user) {
        return loginMapper.addUser(user);
    }
}
