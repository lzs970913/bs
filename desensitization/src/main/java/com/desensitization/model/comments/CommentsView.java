package com.desensitization.model.comments;

public class CommentsView extends Comments{
    private String commentUser;
    private String commentsRoom;

    public String getCommentUser() {
        return commentUser;
    }

    public void setCommentUser(String commentUser) {
        this.commentUser = commentUser;
    }

    public String getCommentsRoom() {
        return commentsRoom;
    }

    public void setCommentsRoom(String commentsRoom) {
        this.commentsRoom = commentsRoom;
    }
}
