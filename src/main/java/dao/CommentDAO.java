/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import util.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.User;
import model.Video;

/**
 *
 * @author luuhu
 */
public class CommentDAO extends DBContext {

    public List<Comment> getCommentsByVideoId(int videoId) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT Comments.commentID, Comments.content, Comments.commentDate, Comments.status, "
                + "Users.userID, Users.username, Users.fullName "
                + "FROM Comments "
                + "INNER JOIN Users ON Comments.userID = Users.userID "
                + "WHERE Comments.videoID = ? AND Comments.status = 1 "
                + "ORDER BY Comments.commentDate DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, videoId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("fullName"));

                Video video = new Video();
                video.setVideoId(videoId);

                Comment comment = new Comment();
                comment.setCommentId(rs.getInt("commentID"));
                comment.setContent(rs.getString("content"));
                comment.setCommentDate(rs.getTimestamp("commentDate"));
                comment.setStatus(rs.getInt("status"));
                comment.setUser(user);
                comment.setVideo(video);
                list.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addComment(int videoId, int userId, String content) {
        String sql = "INSERT INTO Comments(content, userID, videoID) VALUES(?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setInt(2, userId);
            ps.setInt(3, videoId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateComment(int commentId, String content) {
        String sql = "UPDATE Comments SET content = ? WHERE commentID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setInt(2, commentId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteComment(int commentId) {
        String sql = "DELETE FROM Comments WHERE commentID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, commentId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
