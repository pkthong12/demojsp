/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.AccountDAO;
import dal.BookDAO;
import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Book;

/**
 *
 * @author ThinkPad X1 G4
 */
public class EditProductServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String action = request.getParameter("action");
        if ("add".equals(action)) {

        } else {
            String id_raw = request.getParameter("id");
            try {
                int id = Integer.parseInt(id_raw);
                BookDAO acdao = new BookDAO();
                Book book = acdao.getBookByID(id);
                request.setAttribute("book", book);
            } catch (Exception e) {
            }
        }
        request.setAttribute("idcheck", action);
        request.getRequestDispatcher("edit-product.jsp").forward(request, response);
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
        String idcheck = request.getParameter("idcheck");
        String id_raw = request.getParameter("id");
        String tensach = request.getParameter("tensach");
        String tacgia = request.getParameter("tacgia");
        String trongluong_raw = request.getParameter("trongluong");
        String price_raw = request.getParameter("price");
        String giamgia = request.getParameter("giamgia");
        String dinhdang = request.getParameter("dinhdang");
        String category_raw = request.getParameter("category");
        String soluong_raw = request.getParameter("soluong");
        String stt_raw = request.getParameter("stt");
        String img = request.getParameter("img");
        try {
            int category = Integer.parseInt(category_raw);
            int soluong = Integer.parseInt(soluong_raw);
            int stt = Integer.parseInt(stt_raw);
            double price = Double.parseDouble(price_raw);
            double trongluong = Double.parseDouble(trongluong_raw);
            BookDAO bookdao = new BookDAO();
            if ("add".equals(idcheck)) {
                bookdao.addBook(tensach, tacgia, trongluong, price, giamgia, dinhdang, category, soluong, stt, img);
            }
            if ("edit".equals(idcheck)) {
                int id = Integer.parseInt(id_raw);
                bookdao.updateBook(tensach, tacgia, trongluong, price, giamgia, dinhdang, category, soluong, stt, id, img);

            }
            HttpSession session = request.getSession();
            List<Book> listBook = bookdao.getALL();
            session.removeAttribute("listBook");
            session.setAttribute("listBook", listBook);
            response.sendRedirect("tbl-product");

        } catch (Exception e) {
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
