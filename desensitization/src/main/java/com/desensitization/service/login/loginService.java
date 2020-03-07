package com.desensitization.service.login;

import com.desensitization.model.login.User;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:55
 */
public interface loginService {

    //通过用户名去定密码
    User getUserInfoByName(String name);

    //添加用户
    Integer addUser(User user);
}
