/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
<<<<<<< HEAD
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.User;
=======
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
import model.Video;
import util.DBContext;

/**
 *
 * @author luuhu
 */
<<<<<<< HEAD
public class VideoDAO extends DBContext {

    public Video getVideoById(int videoId) {
        String sql = "SELECT v.videoID, v.title, v.description, v.urlThumbnail, v.uploadDate, v.status, "
                + "u.userID, u.username, u.fullName, "
                + "c.categoryID, c.categoryName "
                + "FROM Videos v "
                + "JOIN Users u ON v.userID = u.userID "
                + "JOIN Categories c ON v.categoryID = c.categoryID "
                + "WHERE v.videoID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, videoId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("fullName"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("categoryID"));
                category.setCategoryName(rs.getString("categoryName"));

                Video video = new Video();
                video.setVideoId(rs.getInt("videoID"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setUrlThumbnail(rs.getString("urlThumbnail"));
                video.setUploadDate(rs.getDate("uploadDate"));
                video.setStatus(rs.getInt("status"));
                video.setUser(user);
                video.setCategory(category);
                return video;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Video> getAllVideos() {
        List<Video> list = new ArrayList<>();
        String sql = "SELECT v.videoID, v.title, v.description, v.urlThumbnail, v.uploadDate, v.status, "
                + "u.userID, u.username, u.fullName, "
                + "c.categoryID, c.categoryName "
                + "FROM Videos v "
                + "JOIN Users u ON v.userID = u.userID "
                + "JOIN Categories c ON v.categoryID = c.categoryID "
                + "WHERE v.status = 1";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("fullName"));

                Category category = new Category();
                category.setCategoryId(rs.getInt("categoryID"));
                category.setCategoryName(rs.getString("categoryName"));

                Video video = new Video();
                video.setVideoId(rs.getInt("videoID"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setUrlThumbnail(rs.getString("urlThumbnail"));
                video.setUploadDate(rs.getDate("uploadDate"));
                video.setStatus(rs.getInt("status"));
                video.setUser(user);
                video.setCategory(category);
                list.add(video);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
=======
public class VideoDAO extends DBContext{
    public boolean changeVideoStatus(int videoId, int newStatus) {
    String sql = "UPDATE Videos SET status = ? WHERE videoID = ?";
    try {
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, newStatus);
        ps.setInt(2, videoId);
        int row = ps.executeUpdate();
        return row > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
 
public java.util.List<Video> getAllVideos() {
    java.util.List<Video> list = new java.util.ArrayList<>();
    String sql = "SELECT * FROM Videos ORDER BY uploadDate DESC";
    try {
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Video v = new Video();
            v.setVideoId(rs.getInt("videoID"));
            v.setTitle(rs.getString("title"));
            v.setDescription(rs.getString("description"));
            v.setUploadDate(rs.getDate("uploadDate"));
            v.setStatus(rs.getInt("status"));
            // Cần set user và category nếu cần
            list.add(v);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
}
