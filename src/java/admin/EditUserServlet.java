/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ThinkPad X1 G4
 */
public class EditUserServlet extends HttpServlet {

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
                AccountDAO acdao = new AccountDAO();
                Account ac = acdao.getAccbyID(id);
                request.setAttribute("acc", ac);
            } catch (Exception e) {
            }
        }
        request.setAttribute("idcheck", action);
        request.getRequestDispatcher("edit-user.jsp").forward(request, response);
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
        String user = request.getParameter("username");
        String hoten = request.getParameter("hoten");
        String diachi = request.getParameter("diachi");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String role = request.getParameter("role");
        String stt = request.getParameter("stt");
        AccountDAO acdao = new AccountDAO();
        if ("add".equals(idcheck)) {
            Account a = acdao.checkExitsAcc(user, email);
            if (a == null) {
                acdao.signup(user, pass, hoten, diachi, phone, email, role, stt);
                acdao.createCarts(user);
            } else {
                String noti = "User hoặc email đã tồn tại!";
                HttpSession session = request.getSession();
                session.setAttribute("notifi", noti);
                response.sendRedirect("edit-user?action=add");
            }
        } else {
            boolean cc = acdao.changeInfoAdmin(hoten, phone, diachi, email, role, stt, id_raw);
        }
        response.sendRedirect("tbl-user");
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
