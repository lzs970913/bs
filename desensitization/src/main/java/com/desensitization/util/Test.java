package com.desensitization.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/10
 * @Time:18:51
 */
public class Test {

    public static String hideAllIdCardNum(String contentStr){
//        Pattern pattern = Pattern.compile("(\\d{6})(19|20)(\\d{2})(1[0-2]|0[1-9])(0[1-9]|[1-2][0-9]|3[0-1])(\\d{3})(\\d|X|x)");
//        Matcher matcher = pattern.matcher(contentStr);
//        StringBuffer sb = new StringBuffer();
//        try {
//            while(matcher.find()) {
//                String idCardStr = matcher.group();
//                int len=idCardStr.length();
//                if(len>=9){
//                    idCardStr =  idCardStr.replaceAll("(.{"+(len<12?3:6)+"})(.*)(.{4})", "$1" + "****" + "$3");
//                }
//                matcher.appendReplacement(sb,idCardStr);
//            }
//            matcher.appendTail(sb);
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return sb.toString();
        return null;
    }

    public static void main(String args[]) throws Exception {
        //登录授权获得token
//        Map<String, String> mbSessMap = new HashMap<String, String>();
//        mbSessMap.put("username", "18738804968@163.com");
//        mbSessMap.put("password", "123456");
//        String json= JSON.toJSONString(mbSessMap);
//        String mbSessionJson=HttpClientUtil.postRestful("http://localhost:3000/api/session/", null, json,"utf-8");
//
//        JSONObject mbsessJO = JSONObject.parseObject(mbSessionJson);
//        String metbaseToken = mbsessJO.getString("id");

        //测试登陆后，获取到的接口信息
        Map<String, String> headerMap = new HashMap<String, String>();
        headerMap.put("X-Metabase-Session", "7befea39-9583-4a10-a882-ac99909876a4");
        String str=MbQueryUtil.createCredential(2,622,"query");
        System.out.println(str);
        String res3 = HttpClientUtil.postRestful("http://localhost:3000/api/dataset/",headerMap,str);
        System.out.println("==============res3:"+res3);
        //将得到的数据进行解析
        JsonParser jp = new JsonParser();
        //将json字符串转化成json对象
        JsonObject jo = jp.parse(res3).getAsJsonObject();
        JsonObject rows = jo.get("data").getAsJsonObject();
        //解析数据得到map数据结果集
        List<Map<String,Object>> mapList=MbQueryUtil.getMap(rows);
        for(Map<String,Object> map:mapList){
            System.out.println(new JsonMapperUtil().toJson(map.get("ZJH")));
            //^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$
        }

        //解析数据得到列的数据集
        List<String> ls = MbQueryUtil.dataTreating(rows);
        System.out.println(ls);
        //解析数据得到列类型的数据集



    }

}
