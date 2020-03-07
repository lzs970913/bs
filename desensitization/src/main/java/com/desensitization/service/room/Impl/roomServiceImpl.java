package com.desensitization.service.room.Impl;

import com.desensitization.mapper.room.RoomMapper;
import com.desensitization.model.room.RoomInfo;
import com.desensitization.service.room.IroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:56
 */
@Service
public class roomServiceImpl implements IroomService {

    @Autowired
    RoomMapper roomMapper;

    /**
     * 获得所有的房源信息
     * @return
     */
    @Override
    public List<RoomInfo> getAllRoomInfo() {
        return roomMapper.getAllRoomInfo();
    }

    /**
     * 获得某一个的房源信息
     * @param id
     * @return
     */
    @Override
    public RoomInfo getRoomInfoById(Integer id) {
        return roomMapper.getRoomInfoById(id);
    }

    /**
     * 修改房源信息
     * @param
     * @return
     */
    @Override
    public Integer updataRoomInfo(RoomInfo roomInfo) {
        return roomMapper.updataRoomInfoById(roomInfo);
    }



    /**
     * 删除房源信息
     * @param id
     * @return
     */
    @Override
    public Integer deleteRoomInfoById(Integer id) {
        return roomMapper.deleteRoomInfoById(id);
    }

    /**
     * 添加房源信息
     * @param roomInfo
     * @return
     */
    @Override
    public Integer addRoomInfo(RoomInfo roomInfo) {
        return roomMapper.addRoomInfo(roomInfo);
    }
}
