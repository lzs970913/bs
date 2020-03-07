package com.desensitization.controller.room;

import com.desensitization.model.order.Order;
import com.desensitization.model.order.OrderView;
import com.desensitization.model.room.RoomInfo;
import com.desensitization.model.room.RoomInfoView;
import com.desensitization.service.room.IroomService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/room/")
public class RoomContorler {
    @Autowired
    IroomService iroomService;

    /**
     * 获得所有的房源信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getAllRoomInfo")
    public Map<String, Object> getAllRoomInfo(){
        List<RoomInfo> allRoomInfo = iroomService.getAllRoomInfo();
        Map<String,Object> map = new LinkedHashMap<>();

        List<RoomInfoView> roomInfoViews = new ArrayList<>();
        for(RoomInfo r:allRoomInfo){
            RoomInfoView roomInfoView = new RoomInfoView();
            BeanUtils.copyProperties(r,roomInfoView);
//            String[] split = r.getDescription().split("[?]");
//            if(split.length>1){
//                roomInfoView.setImgUrl(split[1]);
//            }
            roomInfoViews.add(roomInfoView);
        }

        map.put("code",0);
        map.put("msg","");
        map.put("count",roomInfoViews.size());
        map.put("data",roomInfoViews);
        return map;
    }


    @RequestMapping(value = "getAllRoomInfoJSP")
    public String getAllRoomInfoJSP(){

        return "houduan/allRoomInfo";
    }

    @RequestMapping(value = "getAllRoomInfoUserJSP")
    public String getAllRoomInfoUserJSP(){

        return "houduan/allRoomInfoUser";
    }

    /**
     * 获得某一个的房源信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getRoomInfoById/{id}")
    public RoomInfo getRoomInfoById(Integer id){
        return iroomService.getRoomInfoById(id);
    }

    /**
     * 修改房源信息
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "updataRoomInfoById")
    public Integer updataRoomInfoById(@RequestBody RoomInfo roomInfo){
        return iroomService.updataRoomInfo(roomInfo);
    }


    @RequestMapping(value = "updataRoomInfoByIdJSP/{id}")
    public String updataRoomInfoByIdJSP(@PathVariable Integer id, Model model){

        RoomInfo roomInfoById = getRoomInfoById(id);
        model.addAttribute("room",roomInfoById);
        return "houduan/updataRoom";
    }

    @GetMapping("t/{id}")
    @ResponseBody
    public String a(@PathVariable Integer id,HttpServletResponse response){
        if(id == 1){
            response.setStatus(500);
            return "id错误";
        }
        return "删除成功";
    }
    /**
     * 删除房源信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deleteRoomInfoById/{id}")
    public Integer deleteRoomInfoById(@PathVariable Integer id){
        return iroomService.deleteRoomInfoById(id);
    }

    /**
     * 添加房源信息
     * @param roomInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "addRoomInfo")
    public Integer addRoomInfo(@RequestBody RoomInfo roomInfo){
        roomInfo.setStatus("空闲");
        return iroomService.addRoomInfo(roomInfo);
    }
    @RequestMapping(value = "addRoomInfoJSP")
    public String addRoomInfoJSP(){
        return "houduan/addRoom";
    }
}
