/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Configs;
import model.Discount;
import model.MethodPayment;

/**
 *
 * @author ThinkPad X1 G4
 */
public class WebDAO extends DBcontext{
    public List<MethodPayment> getMethod(){
        List<MethodPayment> list = new ArrayList<>();
        String sql = "SELECT * FROM db_web.methodpayment;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add( new MethodPayment(rs.getInt("ID"),rs.getString("NameMethod")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public List<Discount> getAllDis(){
        List<Discount> list = new ArrayList<>();
        String sql = "SELECT * FROM db_web.discounttt";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add( new Discount(rs.getString("Magg").toUpperCase(),rs.getDouble("Rate"),rs.getInt("Stt")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public Configs getConfig() {
        String sql = "SELECT * FROM db_web.configsweb";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Configs c = new Configs(String.valueOf(rs.getInt("ID")),
                        rs.getString("Tenweb"),
                        rs.getString("Facebook"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("DiachiDuong"),
                        rs.getString("Instagram"),
                        rs.getString("DiachiThanhpho"),
                        rs.getString("Zalo"));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Configs configWeb(String tenweb, String diachiduong, String diachithanhpho, String phone,String email, String facebook, String zalo, String insta) {
        String sql = "UPDATE `db_web`.`configsweb`"
                + "SET"
                + "`Tenweb` = ?,"
                + "`DiachiDuong` = ?,"
                + "`DiachiThanhpho` = ?,"
                + "`Phone` = ?,"
                + "`Email` = ?,"
                + "`Facebook` = ?,"
                + "`Zalo` = ? ,"
                + "`Instagram` = ?"
                + "WHERE `ID` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, tenweb);
            st.setString(2, diachiduong);
            st.setString(3, diachithanhpho);
            st.setString(4, phone);
            st.setString(5, email);
            st.setString(6, facebook);
            st.setString(7, zalo);
            st.setString(8,insta);

            st.executeUpdate();
        } catch (Exception e) {
        }
        return null;
    }
}
