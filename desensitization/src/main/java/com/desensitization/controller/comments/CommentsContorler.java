package com.desensitization.controller.comments;


import com.desensitization.model.comments.Comments;
import com.desensitization.model.comments.CommentsView;
import com.desensitization.model.login.User;
import com.desensitization.model.order.Order;
import com.desensitization.service.comments.IcommentsService;
import com.desensitization.service.login.IUserService;
import com.desensitization.service.order.orderService;
import org.springframework.beans.BeanUtils;
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
@RequestMapping(value = "/comments/")
public class CommentsContorler {

    @Autowired
    IcommentsService icommentsService;

    @Autowired
    IUserService iUserService;

    @Autowired
    orderService orderService;

    @RequestMapping(value = "getAllCommentsUserJSP")
    public String getAllCommentsUserJSP(){
        return "houduan/allCommentsUser";
    }


    @RequestMapping(value = "getAllCommentsJSP")
    public String getAllCommentsJSP(){
        return "houduan/allComments";
    }
    @ResponseBody
    @RequestMapping(value = "getAllComments")
    public Map<String,Object> getAllComments(){
        List<Comments> allComments = icommentsService.getAllComments();
        List<CommentsView> commentsViews = new ArrayList<>();

        for(Comments o:allComments){
//            System.out.println(o.getDescription());
            CommentsView commentsView = new CommentsView();
            BeanUtils.copyProperties(o,commentsView);
            commentsView.setCommentsRoom(o.getRoomInfo().getName());
            commentsView.setCommentUser(o.getUser().getName());
            commentsViews.add(commentsView);
        }
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",commentsViews.size());
        map.put("data",commentsViews);
        return map;
    }

    @RequestMapping(value = "addCommentsJSP/{id}")
    public String addCommentsJSP(@PathVariable Integer id, Model model){
        Order orderInfoById = orderService.getOrderInfoById(id);
        model.addAttribute("roomId",orderInfoById.getRoomInfo().getId());
        return "houduan/addComments";
    }

    @ResponseBody
    @RequestMapping(value = "addComments")
    public Integer addComments(@RequestBody Comments comments, HttpSession session){
            String name=(String) session.getAttribute("username");
        User userInfoByName = iUserService.getUserInfoByName(name);
        comments.setCommnentsUser(userInfoByName.getId());

        return icommentsService.addComments(comments);
    }

    @ResponseBody
    @RequestMapping(value = "deleteCommentsById/{id}")
    public Integer deleteCommentsById(@PathVariable Integer id){

        return icommentsService.deleteComments(id);
    }
}
