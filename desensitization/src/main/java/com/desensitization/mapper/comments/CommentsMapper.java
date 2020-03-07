package com.desensitization.mapper.comments;

import com.desensitization.model.comments.Comments;

import java.util.List;

public interface CommentsMapper {

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
