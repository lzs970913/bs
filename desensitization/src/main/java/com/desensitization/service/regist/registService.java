package com.desensitization.service.regist;

import com.desensitization.model.login.User;

import java.util.List;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:55
 */
public interface registService {

    /**
     * 将注册的用户存入数据库
     * @param user
     * @return
     */
    Integer insertUserInfo(User user);


}
