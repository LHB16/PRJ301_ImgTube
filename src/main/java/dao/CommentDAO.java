/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

<<<<<<< HEAD
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.User;
import model.Video;
import util.DBContext;

=======
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
/**
 *
 * @author luuhu
 */
<<<<<<< HEAD
public class CommentDAO extends DBContext {

    public List<Comment> getCommentsByVideoId(int videoId) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT c.commentID, c.content, c.commentDate, c.status, "
                + "u.userID, u.username, u.fullName "
                + "FROM Comments c "
                + "JOIN Users u ON c.userID = u.userID "
                + "WHERE c.videoID = ? AND c.status = 1 "
                + "ORDER BY c.commentDate DESC";
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
                comment.setCommentDate(rs.getDate("commentDate"));
                comment.setStatus(rs.getInt("status"));
                comment.setUser(user);
                comment.setVideo(video);
                list.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addComment(int videoId, int userId, String content) {
        String sql = "INSERT INTO Comments (content, userID, videoID) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, content);
            ps.setInt(2, userId);
            ps.setInt(3, videoId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
=======
public class CommentDAO {
    
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
}
