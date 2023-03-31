/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
public class SignupServlet extends HttpServlet {

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
        String user= request.getParameter("username");
        String email= request.getParameter("email");
        String ho= request.getParameter("firstname");
        String ten = request.getParameter("lastname");
        String pass= request.getParameter("passwd");
        String re_pass= request.getParameter("passwd2");
        String hoten= ho+" "+ten;
        String noti ="";
        if(!pass.equals(re_pass)){
            noti ="Mật khẩu không trùng nhau!";
        }else{
            AccountDAO acdao= new AccountDAO();
            Account a = acdao.checkExitsAcc(user, email);
            if(a==null){
                if(acdao.signup(user, pass,hoten,"","", email,"3","1")){
                    acdao.createCarts(user);
                    noti ="Đăng kí thành công, vui lòng đăng nhập";
                }
                else{
                    noti ="Đăng kí thất bại, vui lòng thử lại";
                }
                
            }else{
                noti ="User hoặc email đã tồn tại!";
            }
        }
        HttpSession session = request.getSession();
        session.setAttribute("notifi",noti);
        response.sendRedirect("login");
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
