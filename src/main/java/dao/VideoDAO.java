/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.User;
import model.Video;
import util.DBContext;

/**
 *
 * @author luuhu
 */
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
}
