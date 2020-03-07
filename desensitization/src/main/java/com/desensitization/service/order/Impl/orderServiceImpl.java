package com.desensitization.service.order.Impl;

import com.desensitization.mapper.order.orderMapper;
import com.desensitization.mapper.reginst.registMapper;
import com.desensitization.model.login.User;
import com.desensitization.model.order.Order;
import com.desensitization.service.order.orderService;
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
public class orderServiceImpl implements orderService {

    @Autowired
    orderMapper orderMapper;

    /**
     * 查看所有的订单信息
     * @param id
     * @return
     */
    @Override
    public List<Order> getAllOrderByUserId(Integer id) {
        return orderMapper.getAllOrderByUserId(id);
    }

    /**
     * 申请修改订单
     * @param
     * @return
     */
    @Override
    public Integer updataOrderByOrderId(Order order) {

        return  orderMapper.updataOrderByOrderId(order);

    }

    @Override
    public List<Order> getAllOrderInfo() {
        return orderMapper.getAllOrderInfo();
    }

    @Override
    public Integer addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    @Override
    public Integer deleteOrderById(Integer id) {
        return orderMapper.deleteOrderById(id);
    }

    @Override
    public Order getOrderInfoById(Integer id) {
        return orderMapper.getOrderInfoById(id);
    }


}
