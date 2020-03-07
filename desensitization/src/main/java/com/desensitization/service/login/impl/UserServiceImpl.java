package com.desensitization.service.login.impl;

import com.desensitization.mapper.login.UserMapper;
import com.desensitization.mapper.login.loginMapper;
import com.desensitization.model.login.User;
import com.desensitization.service.login.IUserService;
import com.desensitization.service.login.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:56
 */
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    UserMapper userMapper;




    @Override
    public User getUserInfoById(Integer id) {
        return userMapper.getUserInfoById(id);
    }

    @Override
    public Integer updataUserInfo(User user) {
        return userMapper.updataUserInfo(user);
    }

    @Override
    public List<User> getAllUserInfo() {
        return userMapper.getAllUserInfo();
    }

    @Override
    public Integer deleteUserInfoById(Integer id) {

        return userMapper.deleteUserInfoById(id);
    }

    @Override
    public Integer updataPasswprd(Integer id) {
        return userMapper.updataPasswprd(id);
    }

    @Override
    public User getUserInfoByName(String name) {
        return userMapper.getUserInfoByName(name);
    }
}
