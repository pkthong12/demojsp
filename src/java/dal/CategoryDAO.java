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
import model.Category;

/**
 *
 * @author ThinkPad X1 G4
 */
public class CategoryDAO extends DBcontext {
    public List<Category> getALL(){
        List<Category> list = new ArrayList<>();
        String sql ="SELECT * FROM db_web.category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Category c= new Category(rs.getInt("ID"), rs.getString("Tenloai"));
                list.add(c);
            }
        } catch (SQLException e) {
            
        }
        return list;
    }
    public Category getCategoryByID(int id){
        String sql ="SELECT * FROM db_web.category where id =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                Category c= new Category(rs.getInt("ID"), rs.getString("Tenloai"));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    public boolean addCategory(String tenloai){
        String query = "INSERT INTO `db_web`.`category` (`Tenloai`) VALUES (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, tenloai);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    public boolean updateCategory(int id,String tenloai){
        String query = "UPDATE `db_web`.`category` SET `Tenloai` = ? WHERE `ID` = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, tenloai);
            ps.setInt(2, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
}
