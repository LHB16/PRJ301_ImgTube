/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import util.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author luuhu
 */
public class SubscriptionDAO extends DBContext {

    private boolean execute(String sql, int p1, int p2) {
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, p1);
            ps.setInt(2, p2);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {

        }
        return false;
    }

    public boolean isSubscribed(int subscriberId, int channelOwnerId) {
        String sql = "SELECT 1 FROM Subscriptions WHERE subscriberID=? AND channelOwnerID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, subscriberId);
            ps.setInt(2, channelOwnerId);
            return ps.executeQuery().next();
        } catch (Exception e) {

        }
        return false;
    }

    public boolean subscribe(int subscriberId, int channelOwnerId) {
        return execute("INSERT INTO Subscriptions(subscriberID, channelOwnerID) VALUES(?,?)",
                subscriberId, channelOwnerId);
    }

    public boolean unsubscribe(int subscriberId, int channelOwnerId) {
        return execute("DELETE FROM Subscriptions WHERE subscriberID=? AND channelOwnerID=?",
                subscriberId, channelOwnerId);
    }

    public int countSubscribers(int channelOwnerId) {
        String sql = "SELECT COUNT(*) FROM Subscriptions WHERE channelOwnerID=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, channelOwnerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }
}
