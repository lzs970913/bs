package com.desensitization.service.room;

import com.desensitization.model.order.Order;
import com.desensitization.model.room.RoomInfo;

import java.util.List;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:55
 */
public interface IroomService {

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
    Integer updataRoomInfo(RoomInfo roomInfo);

    /**
     * 删除房间信息
     */
    Integer deleteRoomInfoById(Integer id);

    /**
     * 添加房源信息
     */
    Integer addRoomInfo(RoomInfo roomInfo);
}
