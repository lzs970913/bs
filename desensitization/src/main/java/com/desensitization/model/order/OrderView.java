package com.desensitization.model.order;

public class OrderView extends Order {
    private String roomName;
    private String userName;
    public String getRoomName() {
        return roomName;
    }

    public OrderView setRoomName(String roomName) {
        this.roomName = roomName;
        return this;
    }

    public String getUserName() {
        return userName;
    }

    public OrderView setUserName(String userName) {
        this.userName = userName;
        return this;
    }
}
