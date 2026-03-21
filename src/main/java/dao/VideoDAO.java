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
        // First, check if we can connect to database
        try {
            // Test basic connection
            java.sql.Statement stmt = conn.createStatement();
            java.sql.ResultSet rsTest = stmt.executeQuery("SELECT COUNT(*) as count FROM Videos");
            if (rsTest.next()) {
                System.out.println("DEBUG: Total videos in database: " + rsTest.getInt("count"));
            }
            rsTest.close();
            stmt.close();
        } catch (Exception e) {
            System.out.println("DEBUG: Cannot connect to Videos table: ");
            e.printStackTrace();
            return list; // Return empty list if can't connect
        }

        // Use the correct column name from SQL file
        String sql = "SELECT Videos.*, Users.fullName\n"
                + "FROM     Users INNER JOIN\n"
                + "                  Videos ON Users.userID = Videos.userID";
        try {
            System.out.println("DEBUG: Connection is null: " + (conn == null));
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;

                User user = new User();
                user.setUserId(rs.getInt("userID"));
                user.setFullName(rs.getString("fullName"));

                Category cat = new Category();
                cat.setCategoryId(rs.getInt("categoryID"));

                Video video = new Video();
                video.setVideoId(rs.getInt("videoID"));
                video.setTitle(rs.getString("title"));
                video.setDescription(rs.getString("description"));
                video.setUrlVideo(rs.getString("urlVideo")); // Column name is correct per SQL file
                video.setUploadDate(rs.getDate("uploadDate"));
                video.setStatus(rs.getInt("status"));
                video.setUser(user);
                video.setCategory(cat);
                list.add(video);
            }
            System.out.println("DEBUG: Found " + count + " videos in database");
        } catch (Exception e) {
            System.out.println("DEBUG: Error in getAllVideos: ");
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

    public java.util.List<Video> getActiveVideosByID(int userID) {
        java.util.List<Video> list = new java.util.ArrayList<>();
        String sql = "SELECT Categories.categoryID, Categories.categoryName, Users.username, Users.userID, Users.fullName, "
                + "Videos.videoID, Videos.title, Videos.description, Videos.urlVideo, Videos.uploadDate, Videos.status "
                + "FROM Categories "
                + "INNER JOIN Videos ON Categories.categoryID = Videos.categoryID "
                + "INNER JOIN Users ON Videos.userID = Users.userID "
                + "WHERE Videos.userID = ? "
                + "ORDER BY Videos.uploadDate DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
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

    public static void main(String[] args) {
        VideoDAO dao = new VideoDAO();
        //System.out.println(dao.getVideoByUserId(2));
        System.out.println("--------");
        System.out.println(dao.getActiveVideos());

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

    public Boolean insert(String title, String description, String urlVideo, int userID, int categoryID) {

        String sql = "insert into Videos (title, description, urlVideo , userID, categoryID) "
                + "VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, urlVideo);
            ps.setInt(4, userID);
            ps.setInt(5, categoryID);
            int row = ps.executeUpdate();
            if (row > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Boolean update(int videoID, String title, String description, String urlVideo, int categoryID) {
        String sql = "update Videos set title=?, description=?, urlVideo=?, categoryID=? where videoID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, urlVideo);
            ps.setInt(4, categoryID);
            ps.setInt(5, videoID);
            int row = ps.executeUpdate();

            if (row > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public Boolean delete(int id) {
        String sqlDeleteComments = "DELETE FROM Comments WHERE videoID = ?";
        String sqlDeleteVideo = "DELETE FROM Videos WHERE videoID = ?";

        try {
            // Bắt đầu transaction
            conn.setAutoCommit(false);

            // Xóa comment trước
            PreparedStatement psComments = conn.prepareStatement(sqlDeleteComments);
            psComments.setInt(1, id);
            psComments.executeUpdate();

            // Xóa video sau
            PreparedStatement psVideo = conn.prepareStatement(sqlDeleteVideo);
            psVideo.setInt(1, id);
            int row = psVideo.executeUpdate();

            conn.commit();
            return row > 0;

        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }
}
