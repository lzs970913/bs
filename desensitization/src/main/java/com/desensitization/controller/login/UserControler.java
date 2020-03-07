package com.desensitization.controller.login;

import com.desensitization.model.comments.Comments;
import com.desensitization.model.login.User;
import com.desensitization.model.order.Order;
import com.desensitization.service.comments.IcommentsService;
import com.desensitization.service.login.IUserService;
import com.desensitization.service.order.orderService;
import com.desensitization.service.room.IroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/user/")
public class UserControler {

    @Autowired
    IUserService iUserService;

    @Autowired
    IcommentsService icommentsService;

    @Autowired
    orderService orderService;

    /**
     * 查看个人信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getUserInfoById/{id}")
    public User getUserInfoById(@PathVariable("id") Integer id){
       return iUserService.getUserInfoById(id);
    }

    @ResponseBody
    @RequestMapping(value = "getMyUserInfo")
    public Map<String, Object> getUserInfoById(HttpSession session){
        String name=(String)session.getAttribute("username");
        User userInfoByName = iUserService.getUserInfoByName(name);
        List<User> list=new ArrayList<>();
        list.add(userInfoByName);
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",list.size());
        map.put("data",list);
        return map;
    }

    @RequestMapping(value = "getMyUserInfoJSP")
    public String getMyUserInfoJSP(){
        return "houduan/myUserInfo";
    }

    /**
     * 修改个人信息
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updataUserInfo")
    public Integer updataUserInfo(@RequestBody User user){
       return iUserService.updataUserInfo(user);

    }

    @RequestMapping(value = "updataUserInfoJSP/{id}")
    public String updataUserInfoJSP(@PathVariable Integer id , Model model){
        User userInfoById = getUserInfoById(id);
        model.addAttribute("user",userInfoById);
        return "houduan/updataUser";

    }

    /**
     * 查看所有用户信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getAllUserInfo")
    public Map<String,Object> getAllUserInfo(){
        List<User> allUserInfo = iUserService.getAllUserInfo();
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",allUserInfo.size());
        map.put("data",allUserInfo);
        return map;
    }

    @RequestMapping(value = "getAllUserInfoJSP")
    public String getAllUserInfoJSP(){

        return "houduan/allUserInfo";
    }

    @RequestMapping(value = "getAllUserInfo1")
    public String getAllUserInfo1(){
        return "firstJsp";
    }

    /**
     * 删除具体用户
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deleteUserInfoById/{id}")
    public Integer deleteUserInfo(@PathVariable Integer id){
        List<Comments> allCommentsByUserId = icommentsService.getAllCommentsByUserId(id);

        //删除对应用户评论
        for(Comments c:allCommentsByUserId){
            icommentsService.deleteComments(c.getId());
        }
        List<Order> allOrderByUserId = orderService.getAllOrderByUserId(id);
        for (Order o:allOrderByUserId){
            orderService.deleteOrderById(o.getId());
        }

        return iUserService.deleteUserInfoById(id);
    }

    /**
     * 重置密码
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updataPasswprd/{id}")
    public Integer updataPasswprd(@PathVariable Integer id){
        return iUserService.updataPasswprd(id);
    }
}
