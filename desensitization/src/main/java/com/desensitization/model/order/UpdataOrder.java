package com.desensitization.model.order;

public class UpdataOrder {

    private Integer roleId;
    private Integer orderRoom;
    private String orderStatus;
    private String orderStartData;
    private String orderEndData;
    private Integer orderUser;
    private Integer orderId;


    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getOrderRoom() {
        return orderRoom;
    }

    public void setOrderRoom(Integer orderRoom) {
        this.orderRoom = orderRoom;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderStartData() {
        return orderStartData;
    }

    public void setOrderStartData(String orderStartData) {
        this.orderStartData = orderStartData;
    }

    public String getOrderEndData() {
        return orderEndData;
    }

    public void setOrderEndData(String orderEndData) {
        this.orderEndData = orderEndData;
    }

    public Integer getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(Integer orderUser) {
        this.orderUser = orderUser;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
}
