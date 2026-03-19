/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBContext;

/**
 *
 * @author luuhu
 */
public class SubscriptionDAO extends DBContext {

    public boolean isSubscribed(int subscriberId, int channelOwnerId) {
        String sql = "SELECT 1 FROM Subscriptions WHERE subscriberID = ? AND channelOwnerID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, subscriberId);
            ps.setInt(2, channelOwnerId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean subscribe(int subscriberId, int channelOwnerId) {
        String sql = "INSERT INTO Subscriptions (subscriberID, channelOwnerID) VALUES (?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, subscriberId);
            ps.setInt(2, channelOwnerId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean unsubscribe(int subscriberId, int channelOwnerId) {
        String sql = "DELETE FROM Subscriptions WHERE subscriberID = ? AND channelOwnerID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, subscriberId);
            ps.setInt(2, channelOwnerId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int countSubscribers(int channelOwnerId) {
        String sql = "SELECT COUNT(*) FROM Subscriptions WHERE channelOwnerID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, channelOwnerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
