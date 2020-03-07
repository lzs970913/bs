package com.desensitization.model.login;

public class User {
    private Integer id;
    private String name;
    private String password;
    private Integer roleId;
    private Integer age;
    private String gender;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRole_id() {
        return roleId;
    }

    public void setRole_id(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
