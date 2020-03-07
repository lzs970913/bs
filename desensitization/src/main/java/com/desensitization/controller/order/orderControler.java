package com.desensitization.controller.order;

import com.desensitization.model.login.User;
import com.desensitization.model.order.Order;
import com.desensitization.model.order.OrderView;
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
@RequestMapping(value = "/order/")
public class orderControler {
    @Autowired
    orderService orderService;

    @Autowired
    IUserService iUserService;

    /**
     * 获取当前用户的所有订单
     */
    @ResponseBody
    @RequestMapping(value = "getAllOrderByUserId")
    public Map<String, Object> getAllOrderByUserId(HttpSession session){
        String name=(String)session.getAttribute("username");
        User userInfoByName = iUserService.getUserInfoByName(name);
        List<Order> allOrderByUserId = orderService.getAllOrderByUserId(userInfoByName.getId());
        List<OrderView> orderViewlist = new ArrayList<>();

        for(Order o:allOrderByUserId){
            OrderView orderView = new OrderView();
            BeanUtils.copyProperties(o,orderView);
            orderView.setRoomName(o.getRoomInfo().getName())
                    .setUserName(o.getUser().getName());
            orderViewlist.add(orderView);
        }
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",orderViewlist.size());
        map.put("data",orderViewlist);
        return map;
    }


    @RequestMapping(value = "getAllOrderByUserIdJSP")
    public String getAllOrderByUserIdJSP(){
        return "houduan/myOrder";

    }

    @RequestMapping(value = "myOrderAddComments")
    public String myOrderAddComments(){
        return "houduan/myOrderAddComments";

    }

    /**
     * 获取所有订单
     */
    @ResponseBody
    @RequestMapping(value = "getAllOrderInfo")
    public Map<String,Object> getAllOrderInfo(){
        List<Order> allOrderInfo = orderService.getAllOrderInfo();
        List<OrderView> orderViewlist = new ArrayList<>();

        for(Order o:allOrderInfo){
            OrderView orderView = new OrderView();
            BeanUtils.copyProperties(o,orderView);
            orderView.setRoomName(o.getRoomInfo().getName())
                    .setUserName(o.getUser().getName());
            orderViewlist.add(orderView);
        }

        Map<String,Object> map = new LinkedHashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",orderViewlist.size());
        map.put("data",orderViewlist);
        return map;
    }

    /**
     * 获取所有订单JSP
     */

    @RequestMapping(value = "getAllOrderInfoJSP")
    public String getAllOrderInfoJSP(){
      return "houduan/allOrderInfo";
    }

    @RequestMapping(value = "getAllOrderInfoAddCommentsJSP")
    public String getAllOrderInfoAddCommentsJSP(){
        return "houduan/allOrderAddCommetnts";
    }


    /**
     * 用户取消订单
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updataOrderByOrderId/{id}")
    public Integer updataOrderByOrderId(@PathVariable("id")Integer id){
        Order order=new Order();
        order.setId(id);
        order.setOrderStatus("商家审核中");
       return orderService.updataOrderByOrderId(order);
    }

    /**
     * 添加订单
     * @param order
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "addOrder")
    public Integer addOrder(@RequestBody Order order,HttpSession session){
        String name=(String)session.getAttribute("username");
        User userInfoByName = iUserService.getUserInfoByName(name);
        order.setOrderStatus("进行中");
        order.setOrderUser(userInfoByName.getId());
        return orderService.addOrder(order);
    }

    @RequestMapping(value = "addOrderJSP/{id}")
    public String addOrderJSP(@PathVariable Integer id, Model model){
        model.addAttribute("orderRoom",id);
        return "houduan/addOrder";
    }

    @ResponseBody
    @RequestMapping(value = "deleteOrder/{id}")
    public Integer deleteOrder(@PathVariable Integer id){

        return orderService.deleteOrderById(id);
    }
}
