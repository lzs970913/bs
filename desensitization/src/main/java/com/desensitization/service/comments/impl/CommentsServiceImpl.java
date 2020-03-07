package com.desensitization.service.comments.impl;

import com.desensitization.mapper.comments.CommentsMapper;
import com.desensitization.mapper.login.loginMapper;
import com.desensitization.model.comments.Comments;
import com.desensitization.model.login.User;
import com.desensitization.service.comments.IcommentsService;
import com.desensitization.service.login.loginService;
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
public class CommentsServiceImpl implements IcommentsService {
  @Autowired
  CommentsMapper commentsMapper;

  @Override
  public Integer addComments(Comments comments) {
    return commentsMapper.addComments(comments);
  }

  /**
   * 删除评论
   * @param id
   * @return
   */
  @Override
  public Integer deleteComments(Integer id) {
    return commentsMapper.deleteComments(id);
  }

  /**
   * 查看所有评论
   * @return
   */
  @Override
  public List<Comments> getAllComments() {
    return commentsMapper.getAllComments();
  }

  @Override
  public List<Comments> getAllCommentsByUserId(Integer id) {
    return commentsMapper.getAllCommentsByUserId(id);
  }
}
