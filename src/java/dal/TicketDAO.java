/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Ticket;

/**
 *
 * @author ThinkPad X1 G4
 */
public class TicketDAO extends DBcontext {
    
    public List<Ticket> getAllTicket(){
        String sql = "SELECT * FROM db_web.ticket";
        AccountDAO adao = new AccountDAO();
        OrderDAO odao = new OrderDAO();
        List<Ticket> tickets = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                Ticket tk = new Ticket();
                tk.setID(rs.getInt("ID"));
                tk.setAccount(adao.getAccbyID(rs.getInt("AccountID")));
                if(null!=rs.getString("OrderID")){
                    tk.setOrder(odao.getOrderByID(rs.getInt("OrderID")));
                }
                tk.setDescription(rs.getString("Description"));
                tk.setReplied(rs.getInt("Replied"));
                tk.setSubstance_rep(rs.getString("Substance_rep"));
                if(rs.getString("ID_person_rep")!=null){
                    tk.setID_rep(rs.getInt("ID_person_rep"));
                }
                tk.setTimeopen(rs.getString("TimeOpen"));
                if(rs.getString("TimeOpen")!=null){
                    tk.setTimereply(rs.getString("TimeOpen"));
                }
                tickets.add(tk);
            }
            return tickets;
        } catch (SQLException ex) {
        }
        return null;
    }
    public boolean cancelOrder(int orderID) {
        String sql = "UPDATE `db_web`.`ordercart` "
                + "SET "
                + "`Stt` = 6 "
                + "WHERE `ID` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            st.execute();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

    public boolean rqcancelOrder(int orderID) {
        String sql = "UPDATE `db_web`.`ordercart` "
                + "SET "
                + "`Stt` = 6 "
                + "WHERE `ID` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            st.execute();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }
    
    public void refundedOrder() {

    }

    public boolean createTicket(int accountID, int orderID, String title, String descript, int replied, String substance) {
        String sql1 = "INSERT INTO `db_web`.`ticket` "
                + "(`AccountID`,"
                + "`OrderID`,"
                + "`Title`,"
                + "`Description`,"
                + "`Replied`,"
                + "`Substance_rep`,"
                + "`TimeOpen`) "
                + "VALUES"
                + "(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st1 = connection.prepareStatement(sql1);
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String dateString = df.format(date);
            st1.setInt(1, accountID);
            st1.setInt(2, orderID);
            st1.setString(3, title);
            st1.setString(4, descript);
            st1.setInt(5, replied);
            st1.setString(6, substance);
            st1.setString(7, dateString);
            st1.execute();
            return true;
        } catch (SQLException e) {

        }
        return false;
    }
}
