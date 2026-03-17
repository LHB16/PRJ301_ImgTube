/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Video;
import util.DBContext;

/**
 *
 * @author luuhu
 */
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
}
