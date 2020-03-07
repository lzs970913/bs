package com.desensitization.mapper.login;

import com.desensitization.model.login.User;

import java.util.List;

public interface UserMapper {
    /**
     * 查看个人信息
     */
    User getUserInfoById(Integer id);

    /**
     * 修改个人信息
     */
    Integer updataUserInfo(User user);


    /**
     * 查看所有用户信息
     */
    List<User> getAllUserInfo();

    /**
     * 删除某个用户
     */

    Integer deleteUserInfoById(Integer id);

    /**
     * 重置密码
     */
    Integer updataPasswprd(Integer id);

    /**
     * 通过用户名查询用户的所有信息
     */
    User getUserInfoByName(String name);
}
