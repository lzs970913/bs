package com.desensitization.mapper.order;

import com.desensitization.model.login.User;
import com.desensitization.model.order.Order;

import java.util.List;

public interface orderMapper {

    /**
     *通过用户id,获取当前用户的订单
     */
    List<Order> getAllOrderByUserId(Integer id);

    /**
     * 通过订单id，获取订单信息
     */
    Order getOrderInfoById(Integer id);

    /**
     * 申请取消订单
     */
    Integer updataOrderByOrderId(Order order);

    /**
     * 获取所有订单信息
     */
    List<Order> getAllOrderInfo();

    /**
     * 删除订单
     */
    Integer deleteOrderById(Integer id);

    /**
     * 通过用户id拿到对应用户的订单
     */
    List<Order> getMyOrderInfoByUserId(Integer id);


    /**
     * 添加订单
     */
    Integer addOrder(Order order);



}
