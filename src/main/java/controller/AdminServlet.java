/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author luuhu
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

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
        
        // Kiểm tra session và role admin
        HttpSession session = request.getSession();
        model.User user = (model.User) session.getAttribute("user");
        
        if (user == null || user.getRole() != 1) {
            response.sendRedirect("login");
            return;
        }
        
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            return;
        }

        if ("manageVideos".equals(action)) {
            dao.VideoDAO videoDAO = new dao.VideoDAO();
            java.util.List<model.Video> videos = videoDAO.getAllVideos();
            request.setAttribute("videos", videos);
            request.getRequestDispatcher("manageVideos.jsp").forward(request, response);
        } else if ("toggleVideoStatus".equals(action)) {
            int videoId = Integer.parseInt(request.getParameter("videoId"));
            int currentStatus = Integer.parseInt(request.getParameter("currentStatus"));
            int newStatus = (currentStatus == 1) ? 0 : 1;

            dao.VideoDAO videoDAO = new dao.VideoDAO();
            boolean success = videoDAO.changeVideoStatus(videoId, newStatus);

            if (success) {
                response.sendRedirect("admin?action=manageVideos&msg=success");
            } else {
                response.sendRedirect("admin?action=manageVideos&msg=error");
            }
        } else if ("manageUsers".equals(action)) {
            dao.UserDAO userDAO = new dao.UserDAO();
            java.util.List<model.User> users = userDAO.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
        } else if ("toggleUserStatus".equals(action)) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int currentStatus = Integer.parseInt(request.getParameter("currentStatus"));
            int newStatus = (currentStatus == 1) ? 0 : 1;

            dao.UserDAO userDAO = new dao.UserDAO();
            boolean success = userDAO.changeUserStatus(userId, newStatus);

            if (success) {
                response.sendRedirect("admin?action=manageUsers&msg=success");
            } else {
                response.sendRedirect("admin?action=manageUsers&msg=error");
            }
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
        processRequest(request, response);
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
