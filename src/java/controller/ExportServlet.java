/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.OrderCart;
import model.Order_Detail;

/**
 *
 * @author ThinkPad X1 G4
 */
public class ExportServlet extends HttpServlet {

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
            out.println("<title>Servlet ExportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getPathInfo();
        switch (action) {
            case "/hoadon":
                XuatHoaDon(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }
//

    public void XuatHoaDon(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderid_raw = request.getParameter("id");
        if(orderid_raw !=""){
            String[] ListID = orderid_raw.split(",");
        List<OrderCart> lorder = new ArrayList<>();
        List<Order_Detail> ldetail = new ArrayList<>();
        for (String id_raw : ListID) {
            if (!"".equals(id_raw)) {
                try {
                    int orderid = Integer.parseInt(id_raw);
                    OrderDAO ordao = new OrderDAO();
                    if (ordao.getOrderDetailForAdmin(orderid).isEmpty()) {
                        response.sendRedirect("404");
                    } else {
                        lorder.add(ordao.getOrderByID(orderid));
                        ldetail.addAll(ordao.getOrderDetailForAdmin(orderid));
                    }
                } catch (IOException | NumberFormatException e) {
                }
            }
        }
        request.setAttribute("order", lorder);
        request.setAttribute("lorder", orderid_raw.replace(",", "_"));
        request.setAttribute("listdetail", ldetail);
        request.getRequestDispatcher("/exportHoadon.jsp").forward(request, response);
        }else{
            response.sendRedirect("/endjava/404");
        }
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
        processRequest(request, response);
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
