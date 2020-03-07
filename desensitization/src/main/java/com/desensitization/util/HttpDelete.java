package com.desensitization.util;

import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;

import java.net.URI;

/**
 * Description:
 *
 * @author 周均洋
 * @create 2018-11-12 13:42
 **/
public  class HttpDelete extends HttpEntityEnclosingRequestBase {

    public HttpDelete(URI uri) {
        super();
        setURI(uri);
    }

    @Override
    public String getMethod() {
        return "DELETE";
    }
}

