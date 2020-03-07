package com.desensitization.mapper.room;

import com.desensitization.model.order.Order;
import com.desensitization.model.room.RoomInfo;

import java.util.List;

public interface RoomMapper {

    /**
     * 查看所有的房间信息
     */
    List<RoomInfo> getAllRoomInfo();

    /**
     * 获得某个房间的信息
     */
    RoomInfo getRoomInfoById(Integer id);

    /**
     * 修改某个房间的信息
     */
    Integer updataRoomInfoById(RoomInfo roomInfo);

    /**
     * 删除房间信息
     */
    Integer deleteRoomInfoById(Integer id);

    /**
     * 添加房源信息
     */
    Integer addRoomInfo(RoomInfo roomInfo);
}
