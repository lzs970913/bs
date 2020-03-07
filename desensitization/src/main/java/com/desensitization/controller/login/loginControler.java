package com.desensitization.controller.login;

import com.desensitization.model.login.User;
import com.desensitization.service.login.IUserService;
import com.desensitization.service.login.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/login/")
public class loginControler {
    @Autowired
    loginService loginService;
    @Autowired
    IUserService iUserService;

    /**
     * 获取表单信息,确实是否登录成功
     */

    @RequestMapping(value = "userLogin")
    public String rightlogin(String name, String password, Model model, HttpSession session){
//
        session.setAttribute("username",name);
        session.setAttribute("password",password);
        User userInfoByName = loginService.getUserInfoByName(name);
        model.addAttribute("userInfo",userInfoByName);
        if(userInfoByName.getPassword().equals(password)&&userInfoByName.getRole_id()==1){
            return "houduan/index";
        }else if(userInfoByName.getPassword().equals(password)&&userInfoByName.getRole_id()==2){
            return "houduan/userPage";
        }else {
            return "houduan/errorLogin";
        }

    }

    @RequestMapping(value = "firstPage")
    public String rightlogin1(Model model,HttpSession session) {
//
        String username = (String) session.getAttribute("username");
        model.addAttribute("username",username);
        return "houduan/welcome2";
    }

    @RequestMapping(value = "regist")
    public String regist(String name,String password,String gender,Integer age) {
//
        List<User> allUserInfo = iUserService.getAllUserInfo();
        for(User u:allUserInfo){
            if(u.getName().equals(name)){
                return "houduan/registError";
            }else {
                User user=new User();
                user.setAge(age);
                user.setGender(gender);
                user.setName(name);
                user.setRole_id(2);
                user.setPassword(password);
                loginService.addUser(user);
                return "houduan/registSuccess";
            }
        }
        return "";

    }
}
