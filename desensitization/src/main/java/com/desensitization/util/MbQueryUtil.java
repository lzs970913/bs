package com.desensitization.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.util.*;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/10
 * @Time:18:16
 */
public class MbQueryUtil {
    /**
     * @describer:创建查询参数对象(令牌方式)
     * @param dbId
     * @param tId
     * @param type
     * @return
     */
    public static final String createCredential(Integer dbId, Integer tId, String type){
        JSONObject myJson = new JSONObject();
        myJson.put("type", type);
        myJson.put("database", dbId);
        JSONArray parameters = new JSONArray();
        myJson.put("parameters", parameters);
        JSONObject querys = new JSONObject();
        querys.put("source-table",tId);
        myJson.put(type, querys);
        JSONArray aggregation = new JSONArray();
        querys.put("aggregation", aggregation);
        return myJson.toString();
    }

    /**
     * @describer:获得表格的结果数据集，并转为map集合
     * @param rows
     * @return
     */
    public static List<Map<String,Object>> getMap(JsonObject rows) throws UnsupportedOperationException {
        //创建list集合用来存储数据
        List<Map<String,Object>> saveData=new ArrayList<>();
        //返回该对象的一组成员
        Set<Map.Entry<String, JsonElement>> jsonSet = rows.entrySet();
        //迭代遍历对象
        Iterator<Map.Entry<String, JsonElement>> it = jsonSet.iterator();
        //循环遍历得到每行的数据
        List<String> ls = dataTreating(rows);
        while (it.hasNext()) {
            Map.Entry<String, JsonElement> jsonElementEntry = it.next();
            String key = jsonElementEntry.getKey();
            if (key != null && "rows".equals(key)) {
                JsonElement jec = jsonElementEntry.getValue();
                JsonArray jsonArray = jec.getAsJsonArray();
                //循环得到某一行的内容
                for (int i = 0; i < jsonArray.size(); i++) {
                    Map<String, Object> mo = new LinkedHashMap();
                    //循环得到表格中每一行的数据
                    JsonElement jtmp = jsonArray.get(i);
                    JsonArray jsTmpC = jtmp.getAsJsonArray();
                    for (int f = 0; f < jsTmpC.size(); f++) {
                        if(jsTmpC.get(f).isJsonNull()==false){
                            String jsTmpCol = jsTmpC.get(f).getAsString();
                            mo.put(ls.get(f), jsTmpCol);
                        }
                    }
                    saveData.add(mo);
                }
            }
        }
        return saveData;
    }

    /**
     * @describersql：获得表格中所有列的数据集
     * @param rows 数据集
     * @return
     */
    public static List dataTreating(JsonObject rows){
        //创建list集合，来存储列的名称
        List<String> fields=new ArrayList();
        //返回该对象的一组成员
        Set<Map.Entry<String, JsonElement>> jsonSet = rows.entrySet();
        //迭代遍历对象
        Iterator<Map.Entry<String, JsonElement>> it = jsonSet.iterator();
        while (it.hasNext()) {
            Map.Entry<String, JsonElement> jsonElementEntry = it.next();
            String key = jsonElementEntry.getKey();
            //得到列的名称集合
            if (key!=null&&"columns".equals(key)) {
                JsonElement je = jsonElementEntry.getValue();
                JsonArray jsTmp = je.getAsJsonArray();
                //循环遍历得到列的名称
                for (int j = 0; j <jsTmp.size(); j++) {
                    JsonElement jetmp = jsTmp.get(j);
                    fields.add(jetmp.getAsString());
                }
            }
        }
        return fields;
    }
}
