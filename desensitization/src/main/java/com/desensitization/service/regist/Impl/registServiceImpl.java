package com.desensitization.service.regist.Impl;

import com.desensitization.mapper.login.loginMapper;
import com.desensitization.mapper.reginst.registMapper;
import com.desensitization.model.login.User;
import com.desensitization.service.regist.registService;
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
public class registServiceImpl implements registService {
    @Autowired
    registMapper registMapper;

    /**
     * 用户注册
     * @param user
     * @return
     */
    @Override
    public Integer insertUserInfo(User user) {
        List<String> allUserInfoName = registMapper.getAllUserInfoName();
        if(allUserInfoName.contains(user.getName())){
            return 0;
        }else {
            return registMapper.insertUserInfo(user);
        }

    }
}
