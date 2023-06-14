/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import dal.TicketDAO;
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
public class OrderDetailServlet extends HttpServlet {

    private final String error = "/endjava/404";
    private final String rqcancelorder = "";
    private int accId, orderid;
    String path;

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
            out.println("<title>Servlet OrderDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailServlet at " + request.getContextPath() + "</h1>");
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
        if (orderid_raw == null) {
            response.sendRedirect("404");
        }

        try {
            HttpSession session = request.getSession();
            accId = ((Account) session.getAttribute("account")).getId();
            orderid = Integer.parseInt(orderid_raw);
            OrderDAO ordao = new OrderDAO();
            if (ordao.getOrderDetailForUser(orderid, accId).isEmpty()) {
                response.sendRedirect("404");
            } else {
                request.setAttribute("order", ordao.getOrderByID(orderid));
                request.setAttribute("listdetail", ordao.getOrderDetailForUser(orderid, accId));
            }
            path = getURL(request);
        } catch (IOException | NumberFormatException e) {
        }
        request.getRequestDispatcher("order_detail.jsp").forward(request, response);
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
        String actionString = request.getPathInfo();
        switch (actionString) {
            case "/cancelOrder":
                cancelOrder(request, response);
                break;
            case "/requestCancelOrder":
                requestCancelOrder(request, response);
                break;
            default:
                request.getRequestDispatcher("404").forward(request, response);
                break;
        }

    }

    public void cancelOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reason = request.getParameter("customRadio");
        if ("Khác".equals(reason)) {
            reason = request.getParameter("mess");
        }
        TicketDAO ticketDAO = new TicketDAO();
        if (ticketDAO.cancelOrder(orderid)) {
            if (ticketDAO.createTicket(accId, orderid, "Hủy đơn hàng", reason, 1, "Đã hủy")) {
                response.sendRedirect(path);
            }
        }
        response.sendRedirect(error);

    }

    public void requestCancelOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reason = request.getParameter("customRadio");
        if ("Khác".equals(reason)) {
            reason = request.getParameter("mess");
        }
        TicketDAO ticketDAO = new TicketDAO();
        if (ticketDAO.cancelOrder(orderid)) {
            if (ticketDAO.createTicket(accId, orderid, "Yêu cầu trả hàng/hoàn tiền", reason, 0, "")) {
                response.sendRedirect(path);
            }
        }
        response.sendRedirect(error);
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

    public static String getURL(HttpServletRequest req) {

        String scheme = req.getScheme();             // http
        String serverName = req.getServerName();     // hostname.com
        int serverPort = req.getServerPort();        // 80
        String contextPath = req.getContextPath();   // /mywebapp
        String servletPath = req.getServletPath();   // /servlet/MyServlet
        String pathInfo = req.getPathInfo();         // /a/b;c=123
        String queryString = req.getQueryString();          // d=789

        // Reconstruct original requesting URL
        StringBuilder url = new StringBuilder();
        url.append(scheme).append("://").append(serverName);

        if (serverPort != 80 && serverPort != 443) {
            url.append(":").append(serverPort);
        }

        url.append(contextPath).append(servletPath);

        if (pathInfo != null) {
            url.append(pathInfo);
        }
        if (queryString != null) {
            url.append("?").append(queryString);
        }
        return url.toString();
    }
}
