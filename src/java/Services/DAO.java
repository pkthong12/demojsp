/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ThinkPad X1 G4
 */
public class DAO extends DBcontext {

    public boolean Checkadmin(String user, String pass) {
        String sql = "SELECT * FROM db_web.Account where username = ? and password= ? or email = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            st.setString(3, user);
            st.setString(4, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean Change(String stt) {
        String sql = "UPDATE db_web.configsweb SET Stt = ? WHERE ID = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, stt);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public int get() {
        String sql = "Select Stt from  db_web.configsweb WHERE ID = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("Stt");
            }
        } catch (SQLException e) {
            System.out.println("" + e);
        }
        return 0;
    }
}
