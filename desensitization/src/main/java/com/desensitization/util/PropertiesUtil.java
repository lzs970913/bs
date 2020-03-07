package com.desensitization.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:15:15
 */
public class PropertiesUtil {
    transient private static Log log = LogFactory.getLog(PropertiesUtil.class);
    private static Properties prop = null;
    /**
     *
     * @Description: 价值配置文件属性
     * @author zhoujunyang
     * @since 2018-08-13
     */
    public static Properties getPropByClassPath(String fileName) {
        InputStream is=null;
        InputStreamReader isr=null;
        try {
            prop = new Properties();
            is = PropertiesUtil.class.getClassLoader()
                    .getResourceAsStream(fileName);
            isr=new InputStreamReader(is,"UTF-8");
            prop.load(isr);


            return prop;
        } catch (Exception e) {
            e.printStackTrace();
            log.debug(e.getMessage());
            return null;
        }finally {
            if (is != null){
                try {
                    is.close();
                } catch (IOException e) {
                    log.error(e,e);
                }
            }

            if (isr != null){
                try {
                    isr.close();
                } catch (IOException e) {
                    log.error(e,e);
                }
            }
        }
    }
    /**
     * @Description: 初始化配置文件
     * @author zhoujunyang
     * @since 2018-08-13
     */
    public static void intiPro(){
        getPropByClassPath("config.properties");
    }
    /**
     * @Description: 根据key从配置文件中获取对应的值
     * @author zhoujunyang
     * @since 2018-08-13
     * @param key properties文件的key
     * @return key从配置文件中获取对应的值
     */
    public static Object getPrp(Object key) {
        if(prop==null){
            intiPro();
        }
        return prop.get(key);
    }
    /**
     * @Description: 根据key从配置文件中获取对应的值
     * @author zhoujunyang
     * @since 2018-08-13
     * @param key properties文件的key
     * @return key从配置文件中获取对应的值
     */
    public static String getPrp(String key) {
        if(prop==null){
            intiPro();
        }
        return prop.getProperty(key);
    }
    /**
     *
     * @Description: 根据key从配置文件中获取对应的值
     * @author zhoujunyang
     * @since 2018-08-13
     * @param key properties文件的key
     * @param defualtValue 默认值
     * @return key从配置文件中获取对应的值
     */
    public static String getPrp(String key,String defualtValue) {
        if(prop==null){
            intiPro();
        }
        return prop.getProperty(key,defualtValue);
    }

}
