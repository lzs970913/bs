package com.desensitization.model.comments;

import com.desensitization.model.login.User;
import com.desensitization.model.room.RoomInfo;

public class Comments {
    private Integer id;
    private String description;
    private Integer roomId;
    private Integer commnentsUser;
    private RoomInfo roomInfo;
    private User user;

    public RoomInfo getRoomInfo() {
        return roomInfo;
    }

    public void setRoomInfo(RoomInfo roomInfo) {
        this.roomInfo = roomInfo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getCommnentsUser() {
        return commnentsUser;
    }

    public void setCommnentsUser(Integer commnentsUser) {
        this.commnentsUser = commnentsUser;
    }
}
