/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import dal.AccountDAO;
import dal.BookDAO;
import dal.CategoryDAO;
import dal.WebDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
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
@MultipartConfig
public class EditProductServlet extends HttpServlet {

    private static final String SAVE_DIR = "img/img-product/";
    private static String img = "";

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
                img = book.getImg();
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
        try {
            Part part = request.getPart("file");
            int category = Integer.parseInt(category_raw);
            int soluong = Integer.parseInt(soluong_raw);
            int stt = Integer.parseInt(stt_raw);
            double price = Double.parseDouble(price_raw);
            double trongluong = Double.parseDouble(trongluong_raw);
            BookDAO bookdao = new BookDAO();
            String str = "";
            if ("add".equals(idcheck)) {
                String fileName = extractFileName(part);
                // refines the fileName in case it is an absolute path
                fileName = new File(fileName).getName();
                String appPath = request.getServletContext().getRealPath("");
                String savePath = appPath + File.separator + SAVE_DIR;

                // creates the save directory if it does not exists
                File fileSaveDir = new File(savePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdir();
                }
                img = SAVE_DIR + renameFile(fileName);
                part.write(savePath + File.separator + renameFile(fileName));

                bookdao.addBook(tensach, tacgia, trongluong, price, giamgia, dinhdang, category, soluong, stt, img);
                str = " đã thêm sách mới " + tensach;
            }
            if ("edit".equals(idcheck)) {
                int id = Integer.parseInt(id_raw);
                String filecheck = part.getSubmittedFileName();
                if ("".equals(filecheck)) {
                } else {
                    String fileName = extractFileName(part);
                    // refines the fileName in case it is an absolute path
                    fileName = new File(fileName).getName();
                    String appPath = request.getServletContext().getRealPath("");
                    String savePath = appPath + File.separator + SAVE_DIR;

                    // creates the save directory if it does not exists
                    File fileSaveDir = new File(savePath);
                    if (!fileSaveDir.exists()) {
                        fileSaveDir.mkdir();
                    }
                    img = SAVE_DIR + renameFile(fileName);
                    part.write(savePath + File.separator + renameFile(fileName));

                }
                bookdao.updateBook(tensach, tacgia, trongluong, price, giamgia, dinhdang, category, soluong, stt, id, img);
                str = " đã cập nhật thông tin sách " + tensach;
            }

            HttpSession session = request.getSession();
            int accId = ((Account) session.getAttribute("account")).getId();
            WebDAO wdao = new WebDAO();
            String user = ((Account) session.getAttribute("account")).getUsername();
            wdao.addHistory(accId, user + str);
            List<Book> listBook = bookdao.getALL();
            session.removeAttribute("listBook");
            session.setAttribute("listBook", listBook);
            response.sendRedirect("tbl-product");

        } catch (ServletException | IOException | NumberFormatException e) {
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public static String renameFile(String fileName) {
        String[] arrImg = fileName.split("\\.");
        String duoiFileImg = arrImg[arrImg.length - 1];
        String nameFile = "";
        for (int i = 0; i < (arrImg.length - 1); i++) {
            if (i == 0) {
                nameFile = arrImg[i];
            } else {
                nameFile += "-" + arrImg[i];
            }
        }
        nameFile = nameFile + "-" + System.nanoTime() + "." + duoiFileImg;
        img = SAVE_DIR + nameFile.replace("_", "-");
        return nameFile.replace("_", "-");
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
