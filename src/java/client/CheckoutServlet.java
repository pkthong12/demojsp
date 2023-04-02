/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package client;

import dal.BookDAO;
import dal.OrderDAO;
import dal.WebDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import static java.util.Map.entry;
import model.Account;
import model.Book;
import model.Carts;
import model.Discount;

/**
 *
 * @author ThinkPad X1 G4
 */
public class CheckoutServlet extends HttpServlet {

    static HashMap<Book, Integer> out = new HashMap<>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        out.clear();
        String value = request.getParameter("order");
        String[] l1 = value.split("tdz");
        String[] l2 = null;
        for (String string : l1) {
            if (string == "" || string == null) {

            } else {
                l2 = string.split("thdzvkl");
                if (Integer.parseInt(l2[0]) == 0 || Integer.parseInt(l2[1]) == 0) {

                } //                    dacat
                else {

                    BookDAO bookdao = new BookDAO();
                    Book bk = bookdao.getBookByID(Integer.parseInt(l2[0]));
                    out.put(bk, Integer.parseInt(l2[1]));
                }
            }
        }
        request.setAttribute("code", out);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ten = request.getParameter("hoten");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String diachi = request.getParameter("diachi");
        String method_raw = request.getParameter("Method");
        String magg = request.getParameter("magg");
        String total_raw = request.getParameter("total");
        String totalfirst_raw = request.getParameter("totalfirst");
        String phiship_raw = request.getParameter("phiship");
        String car_number = "";
        String car_code = "", car_month = "", car_year = "";
        HttpSession session = request.getSession();
        double giamgia = 0;
        if (!"".equals(magg)) {
            List<Discount> listdis = (List<Discount>) session.getAttribute("discountcode");
            for (Discount dis : listdis) {
                if (dis.getMagg().equals(magg.toUpperCase())) {
                    giamgia = dis.getRate();
                }
            }
        }
        if ("4".equals(method_raw)) {
            car_number = request.getParameter("car_number");
            car_code = request.getParameter("car_code");
            car_month = request.getParameter("car_month");
            car_year = request.getParameter("car_year");
        }
        try {
            double total = Double.parseDouble(total_raw);
            double totalfirst = Double.parseDouble(totalfirst_raw);
            int method = Integer.parseInt(method_raw);
            int accId = ((Account) session.getAttribute("account")).getId();
            double phiship = Double.parseDouble(phiship_raw);
            java.util.Date date = new java.util.Date();
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String dateString = df.format(date);
            OrderDAO ordao = new OrderDAO();

            if (ordao.doCheckout(ten, phone, accId, total, diachi, giamgia, dateString, email, method, totalfirst, phiship)) {
                int ID = ordao.getOrderID(accId, dateString);
                WebDAO wdao = new WebDAO();
                String user = ((Account) session.getAttribute("account")).getUsername();
                wdao.addHistory(accId,user+ " đã tạo đơn hàng "+"#"+ID);
                for (Map.Entry<Book, Integer> i : out.entrySet()) {
                    Book bk = i.getKey();
                    int sl = i.getValue();
                    double thanhtien = (bk.getGiaban() - bk.getGiaban() * bk.getGiamgia() / 100) * sl;
                    ordao.insetOrderDetail(ID, bk.getTensach(), sl, thanhtien);
                    BookDAO bdao = new BookDAO();
                    bdao.removetoCarts(bk.getId(), accId);
                }
                session.removeAttribute("giohang");
                BookDAO bk = new BookDAO();
                List<Carts> carts = bk.getBookByCarts(accId);
                session.setAttribute("giohang", carts);
                response.sendRedirect("success.jsp");
                
            }
        } catch (IOException | NumberFormatException e) {

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
