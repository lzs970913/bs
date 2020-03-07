package com.desensitization.controller.order;

import com.desensitization.model.order.Order;
import com.desensitization.service.order.orderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/order/")
public class updataOrderControler {
    @Autowired
    orderService orderService;


}
