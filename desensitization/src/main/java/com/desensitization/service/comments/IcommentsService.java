package com.desensitization.service.comments;

import com.desensitization.model.comments.Comments;
import com.desensitization.model.login.User;

import java.util.List;

/**
 * @describer:
 * @author:fanzhihui
 * @Date:2019/4/11
 * @Time:16:55
 */
public interface IcommentsService {

    /**
     * 添加评论
     */
    Integer addComments(Comments comments);

    /**
     * 删除评论
     */
    Integer deleteComments(Integer id);

    /**
     * 查看评论
     */
    List<Comments> getAllComments();

    /**
     * 通过用户id查询所有评论
     */
    List<Comments> getAllCommentsByUserId(Integer id);
}
