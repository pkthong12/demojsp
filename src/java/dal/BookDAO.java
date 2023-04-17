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
import model.Book;
import model.Carts;
import model.Category;
import model.Discount;

/**
 *
 * @author ThinkPad X1 G4
 */
public class BookDAO extends DBcontext {

    private static List<Carts> listcarts;

    public List<Book> getALL() {
        List<Book> list = new ArrayList<>();
        String sql = "SELECT * FROM db_web.book ORDER BY ID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Book book = new Book();
                book.setId(rs.getInt("ID"));
                book.setTensach(rs.getString("Tensach"));
                book.setTacgia(rs.getString("Tacgia"));
                book.setDinhdang(rs.getString("Dinhdang"));
                book.setTrongluong(rs.getDouble("Trongluong"));
                book.setGiaban(rs.getDouble("Giaban"));
                CategoryDAO cdao = new CategoryDAO();
                Category c = cdao.getCategoryByID(rs.getInt("CategoryID"));
                book.setCategory(c);
                book.setGiamgia(rs.getInt("Giamgia"));
                book.setStt(rs.getInt("statusID"));
                book.setImg(rs.getString("Image"));
                book.setNgaythem(rs.getDate("Ngaythem"));
                book.setSoluong(rs.getInt("Soluong"));
                list.add(book);
            }

            st.close();
        } catch (SQLException e) {
            System.err.println("lỗi nè");
        }
        return list;
    }

    public Book getBookByID(int id) {

        String sql = "SELECT * FROM db_web.book where ID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("ID"));
                book.setTensach(rs.getString("Tensach"));
                book.setTacgia(rs.getString("Tacgia"));
                book.setDinhdang(rs.getString("Dinhdang"));
                book.setTrongluong(rs.getDouble("Trongluong"));
                book.setGiaban(rs.getDouble("Giaban"));
                CategoryDAO cdao = new CategoryDAO();
                Category c = cdao.getCategoryByID(rs.getInt("CategoryID"));
                book.setCategory(c);
                book.setGiamgia(rs.getInt("Giamgia"));
                book.setStt(rs.getInt("statusID"));
                book.setImg(rs.getString("Image"));
                book.setNgaythem(rs.getDate("Ngaythem"));
                book.setSoluong(rs.getInt("Soluong"));
                return book;
            }
            st.close();
        } catch (SQLException e) {
            System.err.println("lỗi nè");
        }
        return null;
    }

    public List<Book> getBookByCategoryID(String id) {
        List<Book> list = new ArrayList<>();
        if (id ==null ||"All".equals(id)) {
            list =getALL();
        } else {
            for (Book book : getALL()) {
                if (Integer.parseInt(id) == book.getCategory().getId()) {
                    list.add(book);
                }
            }
        }

        return list;
    }

    public List<Carts> getBookByCarts(int id) {
        listcarts = new ArrayList<>();
        String sql = "SELECT * FROM db_web.carts where AccountID =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                String a = rs.getString("Spvsl");
                String[] l1 = a.split(",");
                String[] l2 = null;
                for (String string : l1) {
                    if ("".equals(string) || string == null) {

                    } else {
                        l2 = string.split(":");
                        if (Integer.parseInt(l2[0]) == 0 || Integer.parseInt(l2[1]) == 0) {

                        } //                    dacat
                        else {
                            Carts carts = new Carts();
                            carts.setBook(getBookByID(Integer.parseInt(l2[0])));
                            carts.setSoluong(Integer.parseInt(l2[1]));
                            listcarts.add(carts);
                        }

                    }

                }

            }
            st.close();

        } catch (SQLException e) {
            System.err.println("lỗi nè");
        }
        return listcarts;
    }

    public void addtoCarts(int acid, int bookid, int soluong) {
        boolean check = true;
        String str = "";
        for (Carts c : listcarts) {
            if (bookid == c.getBook().getId()) {
                c.setSoluong(c.getSoluong() + soluong);
                check = false;
            }
            str += "," + c.getBook().getId() + ":" + c.getSoluong();
        }
        if (check) {
            Carts carts = new Carts();
            carts.setBook(getBookByID(bookid));
            carts.setSoluong(soluong);
            str += "," + carts.getBook().getId() + ":" + carts.getSoluong();
            listcarts.add(carts);
        }
        String sql = "UPDATE db_web.carts SET Spvsl = '" + str + "' WHERE (AccountID =" + acid + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("lỗi nè");
        }
    }
    
    public List<Carts> updateCarts(String s, int accid){
        String sql ="UPDATE `db_web`.`carts` SET `Spvsl` = ? WHERE `AccountID` = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s);
            st.setInt(2, accid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
        return getBookByCarts(accid);
    }
    public void removetoCarts(int bookid, int acid) {

        String str = "";
        if (listcarts.size() > 1) {
            int vtri = 0;
            for (Carts item : listcarts) {
                if (bookid != item.getBook().getId()) {
                    vtri++;
                } else {
                    break;
                }
            }
            listcarts.remove(vtri);
            for (Carts c : listcarts) {
                str += "," + c.getBook().getId() + ":" + c.getSoluong();
            }
        }
        if (listcarts.size() == 1) {
            listcarts.clear();
            str += ",0:0";
        }
        String sql = "UPDATE db_web.carts SET Spvsl = '" + str + "' WHERE (AccountID =" + acid + ")";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("lỗi nè");
        }
    }

    public Boolean addBook(String tensach, String tacgia, double trongluong, double price, String giamgia, String dinhdang, int category, int soluong, int stt, String img) {
        String sql = "INSERT INTO `db_web`.`book`"
                + "(`Tensach`,"
                + "`Tacgia`,"
                + "`Dinhdang`,"
                + "`Trongluong`,"
                + "`Giaban`,"
                + "`CategoryID`,"
                + "`Giamgia`,"
                + "`statusID`,"
                + "`Image`,"
                + "`Ngaythem`,"
                + "`Soluong`)"
                + "VALUES"
                + "(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            Date date = new Date();
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String dateString = df.format(date);
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tensach.toUpperCase());
            ps.setString(2, tacgia);
            ps.setString(3, dinhdang);
            ps.setDouble(4, trongluong);
            ps.setDouble(5, price);
            ps.setInt(6, category);
            ps.setString(7, giamgia);
            ps.setInt(8, stt);
            ps.setString(9, img);
            ps.setString(10, dateString);
            ps.setInt(11, soluong);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public String updateBook(String tensach, String tacgia, double trongluong, double price, String giamgia, String dinhdang, int category, int soluong, int stt, int id, String img) {
        String sql = "UPDATE db_web.book SET Tensach = ? , Tacgia = ? , Dinhdang = ? , Trongluong = ? , Giaban = ? , CategoryID = ? , Giamgia = ? , statusID = ? , Soluong = ?, Image = ? WHERE ID = " + id;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, tensach);
            ps.setString(2, tacgia);
            ps.setString(3, dinhdang);
            ps.setDouble(4, trongluong);
            ps.setDouble(5, price);
            ps.setInt(6, category);
            ps.setString(7, giamgia);
            ps.setInt(8, stt);
            ps.setInt(9, soluong);
            if("".equals(img)){
                ps.setString(10, "Image");
            }
            else{
                ps.setString(10, img);
            }
            
            ps.executeUpdate();

            return sql;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Boolean deleteBook(int id) {
        String sql = "DELETE FROM db_web.book WHERE ID = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

}
