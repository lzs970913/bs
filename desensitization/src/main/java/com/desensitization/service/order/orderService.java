package com.desensitization.service.order;

import com.desensitization.model.login.User;
import com.desensitization.model.order.Order;

import java.util.List;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:55
 */
public interface orderService {

    /**
     *获取当前用户的订单
     */
    List<Order> getAllOrderByUserId(Integer id);

    /**
     * 申请修改订单
     */
    Integer updataOrderByOrderId(Order order);

    /**
     * 获取所有订单信息
     */
    List<Order> getAllOrderInfo();


    /**
     * 添加订单
     */
    Integer addOrder(Order order);


    /**
     * 删除订单
     */
    Integer deleteOrderById(Integer id);

    /**
     * 通过订单id，获取订单信息
     */
    Order getOrderInfoById(Integer id);
}
