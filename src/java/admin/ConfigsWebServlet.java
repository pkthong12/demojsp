/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.WebDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Configs;

/**
 *
 * @author ThinkPad X1 G4
 */
public class ConfigsWebServlet extends HttpServlet {

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
            out.println("<title>Servlet ConfigsWebServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfigsWebServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("configsweb.jsp").forward(request, response);
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
        String tenweb = request.getParameter("tenweb");
        String diachiduong = request.getParameter("diachiduong");
        String diachithanhpho = request.getParameter("diachithanhpho");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String facebook = request.getParameter("facebook");
        String zalo = request.getParameter("zalo");
        String instagram = request.getParameter("instagram");
        WebDAO wdao = new WebDAO();

        wdao.configWeb(tenweb, diachiduong, diachithanhpho, phone, email, facebook, zalo, instagram);
        Configs fiConfigs = new Configs("1", tenweb, facebook, email, phone, diachiduong, instagram, diachithanhpho, zalo);
        HttpSession session = request.getSession();
        int accId = ((Account) session.getAttribute("account")).getId();
        String user = ((Account) session.getAttribute("account")).getUsername();
        wdao.addHistory(accId, user + " đã cập nhật thông tin web");
        session.removeAttribute("configs");
        session.setAttribute("configs", fiConfigs);
        response.sendRedirect("configs");
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
