/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.Video;
import util.DBContext;
import model.Category;

/**
 *
 * @author luuhu
 */
public class VideoDAO extends DBContext {

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
//        String sql = "SELECT * FROM Videos ORDER BY uploadDate DESC";
        String sql = "SELECT        Categories.categoryID, Categories.categoryName, Users.username, Users.userID, Users.fullName, Videos.videoID, Videos.title, Videos.description, Videos.urlVideo, Videos.uploadDate, Videos.status\n"
                + "FROM            Categories INNER JOIN\n"
                + "                         Videos ON Categories.categoryID = Videos.categoryID INNER JOIN\n"
                + "                         Users ON Videos.userID = Users.userID\n"
                + "ORDER BY Videos.uploadDate DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("fullname"));
                Category cat = new Category();
                cat.setCategoryId(rs.getInt("categoryID"));
                cat.setCategoryName(rs.getString("categoryName"));

                Video video = new Video();
                video.setVideoId(rs.getInt("videoID"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setUrlVideo(rs.getString("urlVideo"));
                video.setUploadDate(rs.getDate("uploadDate"));
                video.setStatus(rs.getInt("status"));
                video.setUser(user);
                video.setCategory(cat);
                list.add(video);
//                return video;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Video getVideoById(int videoId) {
        String sql = "SELECT Videos.videoID, Videos.title, Videos.description, Videos.urlVideo, "
                + "Videos.uploadDate, Videos.status, "
                + "Users.userID, Users.username, Users.fullName, "
                + "Categories.categoryID, Categories.categoryName "
                + "FROM Videos "
                + "INNER JOIN Users       ON Videos.userID     = Users.userID "
                + "INNER JOIN Categories  ON Videos.categoryID = Categories.categoryID "
                + "WHERE Videos.videoID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, videoId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("fullName"));

                Category cat = new Category();
                cat.setCategoryId(rs.getInt("categoryID"));
                cat.setCategoryName(rs.getString("categoryName"));

                Video video = new Video();
                video.setVideoId(rs.getInt("videoID"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setUrlVideo(rs.getString("urlVideo"));
                video.setUploadDate(rs.getDate("uploadDate"));
                video.setStatus(rs.getInt("status"));
                video.setUser(user);
                video.setCategory(cat);
                return video;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public static void main(String[] args) {
        VideoDAO dao = new VideoDAO();
        for (Video v : dao.getAllVideos()) {
            System.out.println(v);
        }

    }

    public java.util.List<Video> getActiveVideos() {
        java.util.List<Video> list = new java.util.ArrayList<>();
        String sql = "SELECT Categories.categoryID, Categories.categoryName, Users.username, Users.userID, Users.fullName, "
                + "Videos.videoID, Videos.title, Videos.description, Videos.urlVideo, Videos.uploadDate, Videos.status "
                + "FROM Categories "
                + "INNER JOIN Videos ON Categories.categoryID = Videos.categoryID "
                + "INNER JOIN Users ON Videos.userID = Users.userID "
                + "WHERE Videos.status = 1 "
                + "ORDER BY Videos.uploadDate DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("fullName"));

                Category cat = new Category();
                cat.setCategoryId(rs.getInt("categoryID"));
                cat.setCategoryName(rs.getString("categoryName"));

                Video video = new Video();
                video.setVideoId(rs.getInt("videoID"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setUrlVideo(rs.getString("urlVideo"));
                video.setUploadDate(rs.getDate("uploadDate"));
                video.setStatus(rs.getInt("status"));
                video.setUser(user);
                video.setCategory(cat);
                list.add(video);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Video> getAllVideosOfCategoriesById(int id) {
        List<Video> list = new ArrayList<>();
        String sql = "SELECT Categories.categoryID, Categories.categoryName, Users.username, Users.userID, Users.fullName, \n"
                + "               Videos.videoID, Videos.title, Videos.description, Videos.urlVideo, Videos.uploadDate, Videos.status \n"
                + "               FROM Categories \n"
                + "               INNER JOIN Videos ON Categories.categoryID = Videos.categoryID \n"
                + "               INNER JOIN Users ON Videos.userID = Users.userID \n"
                + "               WHERE Videos.status = 1\n"
                + "               and Categories.categoryID=?\n"
                + "               ORDER BY Videos.uploadDate DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("fullName"));

                Category cat = new Category();
                cat.setCategoryId(rs.getInt("categoryID"));
                cat.setCategoryName(rs.getString("categoryName"));

                Video video = new Video();
                video.setVideoId(rs.getInt("videoID"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setUrlVideo(rs.getString("urlVideo"));
                video.setUploadDate(rs.getDate("uploadDate"));
                video.setStatus(rs.getInt("status"));
                video.setUser(user);
                video.setCategory(cat);
                list.add(video);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
