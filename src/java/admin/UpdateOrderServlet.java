/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ThinkPad X1 G4
 */
public class UpdateOrderServlet extends HttpServlet {

    int ID;

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
            out.println("<title>Servlet UpdateOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateOrderServlet at " + request.getContextPath() + "</h1>");
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
        String orderid_raw = request.getParameter("order");
        try {
            int orderid = Integer.parseInt(orderid_raw);
            ID = orderid;
            OrderDAO ordao = new OrderDAO();
            if (ordao.getOrderDetailForAdmin(orderid).isEmpty()) {
                response.sendRedirect("404.jsp");
            } else {
                request.setAttribute("order", ordao.getOrderByID(orderid));
                request.setAttribute("orderstt", ordao.getAllOrderStatus());
                request.setAttribute("listdetail", ordao.getOrderDetailForAdmin(orderid));
            }
        } catch (NumberFormatException e) {
        }
        request.getRequestDispatcher("edit-order.jsp").forward(request, response);
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
        String hoten = request.getParameter("hoten");
        String stt_raw = request.getParameter("stt");
        try {
            OrderDAO orderDAO = new OrderDAO();
            int stt = Integer.parseInt(stt_raw);
            if (!"".equals(hoten)) {
                String phone = request.getParameter("phone");
                String diachi = request.getParameter("diachi");
                String email = request.getParameter("email");
                orderDAO.updateOder(ID, hoten, diachi, phone, email, stt);
            }
            if(hoten==null){
                orderDAO.updateOder(ID, "", "", "", "", stt);
            }
        } catch (Exception e) {
        }
        response.sendRedirect("tbl-orders");
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
