package com.desensitization.controller.regist;

import com.desensitization.model.login.User;
import com.desensitization.model.regist.Regist;
import com.desensitization.service.regist.registService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/regist/")
public class registControler {

    @Autowired
    registService registService;

   @RequestMapping(value = "regist")
    public String registUser(){
       return "houduan/regist";
   }
}
