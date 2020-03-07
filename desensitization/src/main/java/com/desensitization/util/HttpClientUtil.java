package com.desensitization.util;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;


import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.*;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.ssl.SSLContextBuilder;

import org.apache.http.cookie.Cookie;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy;
import org.apache.http.impl.client.DefaultRedirectStrategy;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.ssl.TrustStrategy;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/10
 * @Time:17:46
 */
public class HttpClientUtil {
    public static Logger log  = Logger.getLogger(HttpClientUtil.class);

    private static CloseableHttpClient httpClient ;
    private static HttpClientContext context = null;
    private static CookieStore cookieStore = null;
    private static RequestConfig requestConfig = null;

    public static final String METHOD_GET="GET";
    public static final String METHOD_POST="POST";
    public static final String METHOD_PUT="PUT";
    public static final String METHOD_DELETE="DELETE";
    public static final String METHOD_PATCH="PATCH";

    static{
        httpClient = createSSLInsecureClient();
    }

    /**
     * @author: 周均洋
     * create: 2018/11/8
     * Description:初始化CloseableHttpClient 同时支持http和https请求
     **/
    public static CloseableHttpClient createSSLInsecureClient() {
        context = HttpClientContext.create();
        cookieStore = new BasicCookieStore();
        // 配置超时时间（连接服务端超时1秒，请求数据返回超时2秒）
        requestConfig = RequestConfig.custom().setConnectTimeout(120000).setSocketTimeout(60000)
                .setConnectionRequestTimeout(60000).build();

        try {
            SSLContext sslContext = new SSLContextBuilder()
                    .loadTrustMaterial(null, new TrustStrategy() {
                        //信任所有
                        @Override
                        public boolean isTrusted(X509Certificate[] chain,
                                                 String authType) {
                            return true;
                        }
                    }).build();
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext);
            return HttpClients.custom()
                    .setSSLSocketFactory(sslsf)
                    .setKeepAliveStrategy(new DefaultConnectionKeepAliveStrategy())
                    .setRedirectStrategy(new DefaultRedirectStrategy())
                    .setDefaultRequestConfig(requestConfig)
                    .setDefaultCookieStore(cookieStore)
                    .build();
        } catch (KeyManagementException e) {
            log.error(e.getMessage(),e);
        } catch (NoSuchAlgorithmException e) {
            log.error(e.getMessage(),e);
        } catch (KeyStoreException e) {
            log.error(e.getMessage(),e);
        }
        return  HttpClients.createDefault();
    }
    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param methodName 请求方式 get post put DELETE  PATCH这些restful所支持的请求方式
     * @param entity http请求参数
     * @return HttpRequestBase
     * create: 2018/11/8
     * Description:根据不同的请求方式，返回httprequest请求，并且设置相应的请求头信息
     **/
    public static HttpRequestBase getHttpRequest(String url, Map<String,String> hearder, String methodName, HttpEntity entity) throws URISyntaxException {
        HttpRequestBase httpRequest=null;
        if(METHOD_GET.equals(methodName)){
            httpRequest=new HttpGet(url);
        }else if(METHOD_POST.equals(methodName)){
            HttpPost httpPost=new HttpPost(url);
            if(null!=entity){
                httpPost.setEntity(entity);
            }
            httpRequest=httpPost;
        }else if(METHOD_PUT.equals(methodName)){
            HttpPut httpPut=new HttpPut(url);
            if(null!=entity){
                httpPut.setEntity(entity);
            }
            httpRequest=httpPut;
        }else if(METHOD_DELETE.equals(methodName)){
            com.desensitization.util.HttpDelete httpDelete=new com.desensitization.util.HttpDelete(new URI(url));
            if(null!=entity){
                httpDelete.setEntity(entity);
            }
            httpRequest=httpDelete;
        }else if(METHOD_PATCH.equals(methodName)){
            HttpPatch httpPatch=new HttpPatch(url);
            if(null!=entity){
                httpPatch.setEntity(entity);
            }
            httpRequest=httpPatch;
        }
        if(hearder!=null){
            for(String key:hearder.keySet()){
                httpRequest.setHeader(key, hearder.get(key));
            }
        }
        return httpRequest;
    }

    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param methodName 请求方式 get post put DELETE  PATCH这些restful所支持的请求方式
     * @return HttpRequestBase
     * create: 2018/11/8
     * Description:根据不同的请求方式，返回httprequest请求，并且设置相应的请求头信息
     **/
    public static HttpRequestBase getHttpRequest(String url, Map<String,String> hearder, String methodName) throws URISyntaxException {
        return getHttpRequest(url,hearder,methodName,null);
    }

    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param methodName 请求方式 get post put DELETE  PATCH这些restful所支持的请求方式
     * @param encode 字符编码
     * @return httpPost
     * create: 2018/11/8
     * Description:执行http请求，并且返回结果
     **/
    public static String exeHttpRequest(String url,Map<String,String> hearder,String methodName,String encode) throws IOException, URISyntaxException {
        HttpRequestBase httpRequest=getHttpRequest(url,hearder,methodName);
        HttpResponse httpResponse= httpClient.execute(httpRequest);
        return EntityUtils.toString(httpResponse.getEntity(),encode);
    }
    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param methodName 请求方式 get post put DELETE  PATCH这些restful所支持的请求方式
     * @param encode 字符编码
     * @return httpPost
     * create: 2018/11/8
     * Description:执行http请求，并且返回结果
     **/
    public static String exeHttpRequest(String url,Map<String,String> hearder,String methodName, HttpEntity entity,String encode) throws IOException, URISyntaxException {
        HttpRequestBase httpRequest=getHttpRequest(url,hearder,methodName,entity);
        HttpResponse httpResponse= httpClient.execute(httpRequest);
        String jsonRes=null;
        HttpEntity httpEntity=httpResponse.getEntity();
        if(null!=httpEntity){
            jsonRes= EntityUtils.toString(httpResponse.getEntity(),encode);
        }
        return jsonRes;

    }

    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param encode 编码格式
     * @return 返回请求结果
     * create: 2018/11/8
     * Description:执行get请求 并返回请求结果
     **/
    public static String get(String url,Map<String,String> hearder,String encode) throws Exception{

        if(null==hearder){
            hearder=new HashMap<String,String>();
        }
        hearder.put("accept", "*/*");
        hearder.put("connection", "Keep-Alive");
        HttpGet httpGet = (HttpGet) getHttpRequest(url,hearder,METHOD_GET);
        HttpResponse httpResponse= httpClient.execute(httpGet);
        return EntityUtils.toString(httpResponse.getEntity(),encode);
    }

    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param entity 请求参数
     * @return httpPost
     * create: 2018/11/8
     * Description:获取httpPost请求
     **/
    public static HttpPost getHttpPost(String url,Map<String,String> hearder, HttpEntity entity) throws URISyntaxException {
        HttpPost httpPost = (HttpPost) getHttpRequest(url, hearder, METHOD_POST);
        if(null!=entity){
            httpPost.setEntity(entity);
        }
        return httpPost;
    }
    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param param 请求参数
     * @param charset 请求的编码格式
     * @return httpPost
     * create: 2018/11/8
     * Description:获取httpPost请求
     **/
    public static HttpPost getHttpPost(String url,Map<String,String> hearder, Map<String, String> param,String charset)throws URISyntaxException {
        HttpPost httpPost = null;
        try {
            UrlEncodedFormEntity formEntity = null;
            if (charset == null || StringUtils.isEmpty(charset)) {
                formEntity = new UrlEncodedFormEntity(getParamsList(param));
            } else {
                formEntity = new UrlEncodedFormEntity(getParamsList(param), charset);
            }
            httpPost=getHttpPost(url,hearder, formEntity);
        }catch (UnsupportedEncodingException e) {
            log.error(e.getMessage(),e);
        } catch (IOException e) {
            log.error(e.getMessage(),e);
        }
        return httpPost;
    }

    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param jsonParam 请求参数(json 格式 一般对应restful请求)
     * @param charset 请求的编码格式
     * @return httpPost
     * create: 2018/11/8
     * Description:获取httpPost请求
     **/
    public static HttpPost getHttpPost(String url,Map<String,String> hearder, String jsonParam,String charset) throws URISyntaxException {
        StringEntity entity=null;
        if(null!=charset && !"".equals(charset.trim())){
            entity = new StringEntity(jsonParam,charset);
        }else{
            try {
                entity = new StringEntity(jsonParam);
            } catch (UnsupportedEncodingException e) {
                log.error(e.getMessage(),e);
            }
        }
        HttpPost httpPost =getHttpPost(url,hearder, entity);
        return httpPost;
    }

    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param param 请求参数
     * @param charset 请求的编码格式
     * @return 返回请求结果
     * create: 2018/11/8
     * Description:执行POST请求 并且返回请求结果
     **/
    public static String post(String url,Map<String,String> hearder, Map<String, String> param,String charset){
        String response  = "";
        CloseableHttpResponse httpResponse = null;
        if(null==hearder){
            hearder=new HashMap<String,String>();
        }
        hearder.put("accept", "*/*");
        hearder.put("connection", "Keep-Alive");
        hearder.put("user-agent","Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");

        try {
            HttpPost httpPost =getHttpPost(url,hearder,param,charset);
            httpResponse = httpClient.execute(httpPost);
            response = EntityUtils.toString(httpResponse.getEntity());
        }catch (UnsupportedEncodingException e) {
            log.error(e.getMessage(),e);
        }catch(ClientProtocolException e) {
            log.error(e.getMessage(),e);
        } catch (IOException e) {
            log.error(e.getMessage(),e);
        } catch (URISyntaxException e) {
            log.error(e.getMessage(),e);
        } finally {
            try {
                httpResponse.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return response;
    }

    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param json 请求参数
     * @return 返回请求结果
     * create: 2018/11/8
     * Description:执行POST方式的restful请求 返回请求结果
     **/
    public static String postRestful(String url, Map<String,String> hearder, String json){
        return postRestful(url,hearder,json,"utf-8");
    }

    /**
     * @author: 周均洋
     * @param  url 请求的url
     * @param hearder 需要设置的请求头
     * @param json 请求参数
     * @param charset 编码
     * @return 返回请求结果
     * create: 2018/11/8
     * Description:执行POST方式的restful请求 返回请求结果
     **/
    public static String postRestful(String url,Map<String,String> hearder,String json,String charset){
        CloseableHttpResponse httpResponse = null;
        String response = "";
        if(null==hearder){
            hearder=new HashMap<String,String>();
        }
        hearder.put("content-type", "application/json");
        hearder.put("Accept", "application/json");
        try {
            HttpPost httpPost =getHttpPost(url,hearder,json,charset);
            httpResponse = httpClient.execute(httpPost);
            response = EntityUtils.toString(httpResponse.getEntity());
        } catch (ClientProtocolException e) {
            log.error(e.getMessage(),e);
        } catch (IOException e) {
            log.error(e.getMessage(),e);
        } catch (URISyntaxException e) {
            log.error(e.getMessage(),e);
        } finally {
            try {
                httpResponse.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return response;
    }

    /**
     * @author: 周均洋
     * @param  reqURL 请求的url
     * @param hearder 需要设置的请求头
     * @param params 请求参数
     * @param encodeCharset 请求的编码格式
     * @return 返回请求结果，和cookie信息
     * create: 2018/11/8
     * Description:执行POST请求 并且返回请求结果，和cookie信息
     **/
    public static Map<String,Object> postReturnCookie(String reqURL,Map<String,String> hearder,Map params, String encodeCharset){
        CloseableHttpResponse response = null;
        Map<String,Object> map = new HashMap<String,Object>();
        String reseContent = "通信失败";
        HttpPost httpPost = null;
        if(null==hearder){
            hearder=new HashMap<String,String>();
        }
        //由于下面使用的是new StringEntity(....),所以默认发出去的请求报文头中CONTENT_TYPE值为text/plain; charset=ISO-8859-1
        //这就有可能会导致服务端接收不到POST过去的参数,比如运行在Tomcat6.0.36中的Servlet,所以我们手工指定CONTENT_TYPE头消息
        hearder.put(HTTP.CONTENT_TYPE, "application/x-www-form-urlencoded; charset=" + encodeCharset);
        try{
            httpPost =getHttpPost(reqURL,hearder,params,encodeCharset);
            response = httpClient.execute(httpPost,context);

            CookieStore cookieStore = context.getCookieStore();
            List<Cookie> cookies = cookieStore.getCookies();
            map.put("cookies", cookies);
            HttpEntity entity = response.getEntity();
            if (null != entity) {
                reseContent = EntityUtils.toString(entity, ContentType.getOrDefault(entity).getCharset());
                EntityUtils.consume(entity);
            }
            map.put("result", reseContent);
        } catch (ConnectTimeoutException cte){
            log.error("请求通信[" + reqURL + "]时连接超时,堆栈轨迹如下", cte);
        } catch (SocketTimeoutException ste){
            log.error("请求通信[" + reqURL + "]时读取超时,堆栈轨迹如下", ste);
        }catch(Exception e){
            log.error("请求通信[" + reqURL + "]时偶遇异常,堆栈轨迹如下", e);
        }finally{
            try {
                response.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return map;
    }

    /**
     * @author: 周均洋
     * @param  reqURL 请求的url
     * @param hearder 需要设置的请求头
     * @param params 请求参数
     * @param encodeCharset 请求的编码格式
     * @param cookie 需要写入cookie的内容
     * @return 返回请求结果
     * create: 2018/11/8
     * Description:执行POST请求 写cookie 并且返回请求结果
     **/
    public static String postWithCookie(String reqURL,Map<String,String> hearder,Map params, String encodeCharset,String cookie){
        String reseContent = "通信失败";
        CloseableHttpResponse response = null;
        HttpPost httpPost = null;
        if(null==hearder){
            hearder=new HashMap<String,String>();
        }
        //由于下面使用的是new StringEntity(....),所以默认发出去的请求报文头中CONTENT_TYPE值为text/plain; charset=ISO-8859-1
        //这就有可能会导致服务端接收不到POST过去的参数,比如运行在Tomcat6.0.36中的Servlet,所以我们手工指定CONTENT_TYPE头消息
        hearder.put(HTTP.CONTENT_TYPE, "application/x-www-form-urlencoded; charset=" + encodeCharset);
        hearder.put("Cookie",cookie);
        try{
            httpPost =getHttpPost(reqURL,hearder,params,encodeCharset);
            response = httpClient.execute(httpPost,context);

            HttpEntity entity = response.getEntity();
            if (null != entity) {
                reseContent = EntityUtils.toString(entity, ContentType.getOrDefault(entity).getCharset());
                EntityUtils.consume(entity);
            }
        } catch (ConnectTimeoutException cte){
            log.error("请求通信[" + reqURL + "]时连接超时,堆栈轨迹如下", cte);
        } catch (SocketTimeoutException ste){
            log.error("请求通信[" + reqURL + "]时读取超时,堆栈轨迹如下", ste);
        }catch(Exception e){
            log.error("请求通信[" + reqURL + "]时偶遇异常,堆栈轨迹如下", e);
        }finally{
            try {
                response.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return reseContent;
    }


    /**
     * @author: 周均洋
     * @param  reqURL 请求的url
     * @param hearder 需要设置的请求头
     * @param params 请求参数
     * @param cookie 要设置的cookie
     * @param file 要上传到远程的文件
     * @return 返回请求结果
     * create: 2018/11/8
     * Description:执行POST请求 上传文件 返回请求结果
     **/
    public static String postFile(String reqURL, Map<String,String> hearder, Map<String,Object> params, String cookie, File file) throws IOException, URISyntaxException {
        FileBody fileBody = null;

        if(null==hearder){
            hearder=new HashMap<String,String>();
        }
        hearder.put("Cookie",cookie);

        if (file != null) {
            fileBody = new FileBody(file);
        }

        MultipartEntityBuilder builder = MultipartEntityBuilder.create();
        builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        if(params!=null){
            for(String paramKey:params.keySet()){
                StringBody keyBody = new StringBody(params.get(paramKey).toString(), ContentType.MULTIPART_FORM_DATA);
                builder.addPart(paramKey,keyBody);
            }
        }

        builder.addPart("file", fileBody);
        HttpEntity entity = builder.build();

        HttpPost httppost =getHttpPost(reqURL,hearder,entity);
        log.info("执行: " + httppost.getRequestLine());
        CloseableHttpResponse response = httpClient.execute(httppost);
        log.info("response:"+response);
        log.info("statusCode is "
                + response.getStatusLine().getStatusCode());
        HttpEntity resEntity = response.getEntity();
        log.info("----------------------------------------");
        log.info(response.getStatusLine());
        if (resEntity != null) {
            log.info("返回长度: " + resEntity.getContentLength());
            log.info("返回类型: " + resEntity.getContentType());
            InputStream in = resEntity.getContent();
            String returnValue = inputStream2String(in);
            log.info("returnValue:" + returnValue);
            //上传到文件服务器后，删除本地的文件
            file.deleteOnExit();
            response.close();
            return returnValue;
        }
        return null;
    }

    /**
     * @author: 周均洋
     * @param  in 文件流转字符串
     * @return 返回请求结果
     * create: 2018/11/8
     * Description:执行POST请求 上传文件 返回请求结果
     **/
    public static String inputStream2String(InputStream in) throws IOException {
        StringBuffer out = new StringBuffer();
        byte[] b = new byte[4096];
        for (int n; (n = in.read(b)) != -1;) {
            out.append(new String(b, 0, n));
        }
        return out.toString();
    }

    /**
     * @author: 周均洋
     * @param  paramsMap 参数
     * @return 返回请求结果
     * create: 2018/11/8
     * Description:获取参数列表
     **/
    private static List getParamsList(Map<String,String> paramsMap) {
        if (paramsMap == null || paramsMap.size() == 0) {
            return null;
        }
        List params = new ArrayList();
        for (Map.Entry<String,String> map : paramsMap.entrySet()) {
            params.add(new BasicNameValuePair(map.getKey(), map.getValue()));
        }
        return params;
    }

}
