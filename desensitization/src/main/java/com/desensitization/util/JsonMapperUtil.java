package com.desensitization.util;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;

/**
 * @describer:转json数据
 * @author:fanzhihui
 * @Date:2019/4/10
 * @Time:18:49
 */
public class JsonMapperUtil {
    private static ObjectMapper mapper = new ObjectMapper();
    public String toJson(Object object) {
        try {
            return mapper.writeValueAsString(object);
        } catch (IOException e) {
            System.out.println("write to json string error");
            return null;
        }
    }
}
