package com.desensitization.model.regist;


import javax.xml.crypto.Data;

/**
 * <p>
 *
 * </p>
 *
 * @author fanzhihui
 * @since 2018-09-30
 */
public class Regist {
    private String email;
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
