package com.desensitization.mapper.reginst;


import com.desensitization.model.login.User;

import java.util.List;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:57
 */
public interface registMapper {

    //用户注册信息存入数据库
   Integer insertUserInfo(User user);

   //获得所有的用户名
    List<String> getAllUserInfoName();
}
