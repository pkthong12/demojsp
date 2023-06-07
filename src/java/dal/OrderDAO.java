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
import model.Account;
import model.MethodPayment;
import model.OrderCart;
import model.OrderStatus;
import model.Order_Detail;

/**
 *
 * @author ThinkPad X1 G4
 */
public class OrderDAO extends DBcontext {

    BookDAO bdao = new BookDAO();
    public List<OrderCart> getAllOrderForAdmin() {
        List<OrderCart> listorder = new ArrayList<>();
        String sql = "SELECT * FROM db_web.ordercart ORDER BY Thoigian DESC ";
        WebDAO wdao = new WebDAO();
        List<MethodPayment> listmethod = wdao.getMethod();
        MethodPayment method = new MethodPayment();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderCart orderCart = new OrderCart();
                orderCart.setID(rs.getInt("ID"));
                orderCart.setHoten(rs.getString("Hoten"));
                orderCart.setPhone(rs.getString("Phone"));
                AccountDAO acdao = new AccountDAO();
                Account ac = acdao.getAccbyID(rs.getInt("AccountID"));
                orderCart.setAccount(ac);
                orderCart.setTotal(rs.getDouble("Total"));
                orderCart.setStatus(getOrderStatus(rs.getInt("Stt")));
                orderCart.setDiachi(rs.getString("Diachi"));
                orderCart.setGiamgia(rs.getDouble("Giamgia"));
                orderCart.setThoigian(rs.getString("Thoigian"));
                orderCart.setEmail(rs.getString("Email"));
                for (MethodPayment methodPayment : listmethod) {
                    if (rs.getInt("Method") == methodPayment.getId()) {
                        method = methodPayment;
                    }
                }
                orderCart.setMethod(method);
                orderCart.setTotalFirst(rs.getDouble("TotalFirst"));
                orderCart.setPhiship(rs.getDouble("Phiship"));
                listorder.add(orderCart);
            }
            return listorder;
        } catch (SQLException e) {
        }
        return null;
    }

    public List<OrderCart> getAllOrderOfUser(int id) {
        List<OrderCart> listorder = getAllOrderForAdmin();
        List<OrderCart> listorderUser = new ArrayList<>();
        for (OrderCart orderCart : listorder) {
            if (id == orderCart.getAccount().getId()) {
                listorderUser.add(orderCart);
            }
        }
        return listorderUser;
    }

    public OrderCart getOrderByID(int orderid) {
        List<OrderCart> listorder = getAllOrderForAdmin();
        for (OrderCart orderCart : listorder) {
            if (orderid == orderCart.getID()) {
                return orderCart;
            }
        }
        return null;
    }

    public List<Order_Detail> getOrderDetailForUser(int orderid, int accid) {
        List<Order_Detail> listdetail = new ArrayList<>();
        String sql = "SELECT db_web.order_detail.ID, OrderID, BookID, Giaban, Soluong, Thanhtien FROM  db_web.order_detail inner join db_web.ordercart on  db_web.order_detail.OrderID = db_web.ordercart.ID"
                + " where db_web.ordercart.ID = ? and db_web.ordercart.AccountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderid);
            st.setInt(2, accid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order_Detail detail = new Order_Detail(rs.getInt("ID"),
                        rs.getInt("OrderID"),
                        bdao.getBookByID(rs.getInt("BookID")),
                        rs.getInt("Soluong"),
                        rs.getDouble("Thanhtien"),
                        rs.getDouble("Giaban"));
                listdetail.add(detail);
            }
            return listdetail;
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Order_Detail> getOrderDetailForAdmin(int orderid) {
        List<Order_Detail> listdetail = new ArrayList<>();
        String sql = "SELECT db_web.order_detail.ID, OrderID, BookID, Giaban, Soluong, Thanhtien FROM  db_web.order_detail inner join db_web.ordercart on  db_web.order_detail.OrderID = db_web.ordercart.ID"
                + " where db_web.ordercart.ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                Order_Detail detail = new Order_Detail(rs.getInt("ID"),
                        rs.getInt("OrderID"),
                        bdao.getBookByID(rs.getInt("BookID")),
                        rs.getInt("Soluong"),
                        rs.getDouble("Thanhtien"),
                        rs.getDouble("Giaban"));
                listdetail.add(detail);
            }
            return listdetail;
        } catch (SQLException e) {
        }
        return null;
    }
    
    public boolean doCheckout(String hoten, String phone, int accId, double total, String diachi, double giamgia, String thoigian, String email, int method, double totalfirst, double phiship) {
        String sql = "INSERT INTO db_web.ordercart "
                + "(Hoten, Phone, AccountID, Total, Stt, Diachi, Giamgia, Thoigian, Email, Method, TotalFirst,Phiship) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, hoten);
            st.setString(2, phone);
            st.setInt(3, accId);
            st.setDouble(4, total);
            st.setString(5, "1");
            st.setString(6, diachi);
            st.setDouble(7, giamgia);
            st.setString(8, thoigian);
            st.setString(9, email);
            st.setInt(10, method);
            st.setDouble(11, totalfirst);
            st.setDouble(12, phiship);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {

        }
        return false;
    }

    public void insetOrderDetail(int orderid, int bookID, int soluong, double thanhtien) {
        String sql = "INSERT INTO `db_web`.`order_detail` (`OrderID`, `BookID`,`Soluong`,`Thanhtien`,`Giaban`)"
                + "VALUES (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderid);
            st.setInt(2, bookID);
            st.setInt(3, soluong);
            st.setDouble(4, thanhtien);
            st.setDouble(5, (thanhtien / soluong));
            st.executeUpdate();
        } catch (SQLException e) {
        }

    }

    public int getOrderID(int accId, String thoigian) {
        String sql = "SELECT ID FROM db_web.ordercart where AccountID =? and Thoigian =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accId);
            st.setString(2, thoigian);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("ID");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<OrderStatus> getAllOrderStatus() {
        List<OrderStatus> listorderStatus = new ArrayList<>();
        String sql = "SELECT * FROM db_web.order_status";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderStatus status = new OrderStatus(rs.getInt("ID"), rs.getString("des_status"));
                listorderStatus.add(status);
            }
        } catch (SQLException e) {
        }
        return listorderStatus;
    }

    public OrderStatus getOrderStatus(int id) {
        List<OrderStatus> listorderStatus = getAllOrderStatus();
        for (OrderStatus orderStatu : listorderStatus) {
            if (id == orderStatu.getID()) {
                return orderStatu;
            }
        }
        return null;
    }

    public void updateOder(int id, String hoten, String diachi, String phone, String email, int stt) {
        PreparedStatement st;
        String sql;
        if (!"".equals(hoten)) {
            sql = "UPDATE `db_web`.`ordercart`"
                    + "SET"
                    + "`Hoten` = ?,"
                    + "`Phone` = ?,"
                    + "`Stt` = ?,"
                    + "`Diachi` = ?,"
                    + "`Email` = ?"
                    + "WHERE `ID` = ?";
            try {
                st = connection.prepareStatement(sql);
                st.setString(1, hoten);
                st.setString(2, phone);
                st.setInt(3, stt);
                st.setString(4, diachi);
                st.setString(5, email);
                st.setInt(6, id);
                st.executeUpdate();
            } catch (SQLException e) {
            }
        } else {
            sql = "UPDATE `db_web`.`ordercart` SET `Stt` = ? WHERE `ID` = ?";
            try {
                st = connection.prepareStatement(sql);
                st.setInt(1, stt);
                st.setInt(2, id);
                st.executeUpdate();
            } catch (SQLException e) {
            }
        }

    }

    
}
