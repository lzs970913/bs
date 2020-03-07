package com.desensitization.model.order;

import com.desensitization.model.login.User;
import com.desensitization.model.room.RoomInfo;

public class Order {
    private Integer id;
    private Integer roleId;
    private Integer orderRoom;
    private String orderStatus;
    private String orderStartData;
    private String orderEndData;
    private Integer orderUser;
    private User user;
    private RoomInfo roomInfo;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public RoomInfo getRoomInfo() {
        return roomInfo;
    }

    public void setRoomInfo(RoomInfo roomInfo) {
        this.roomInfo = roomInfo;
    }

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

    public Integer getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(Integer orderUser) {
        this.orderUser = orderUser;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}
