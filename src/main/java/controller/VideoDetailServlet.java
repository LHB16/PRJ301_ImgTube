/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CommentDAO;
import dao.SubscriptionDAO;
import dao.VideoDAO;
import model.User;
import model.Video;
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
@WebServlet(name = "VideoDetailServlet", urlPatterns = {"/videodetail"})
public class VideoDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet VideoDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VideoDetailServlet at " + request.getContextPath() + "</h1>");
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

        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("home");
            return;
        }

        int videoId = Integer.parseInt(idStr);

        VideoDAO videoDAO = new VideoDAO();
        CommentDAO commentDAO = new CommentDAO();
        SubscriptionDAO subDAO = new SubscriptionDAO();

        Video video = videoDAO.getVideoById(videoId);
        if (video == null) {
            response.sendRedirect("home");
            return;
        }

        request.setAttribute("video", video);
        request.setAttribute("comments", commentDAO.getCommentsByVideoId(videoId));
        request.setAttribute("subscriberCount", subDAO.countSubscribers(video.getUser().getUserId()));

        boolean isSubscribed = false;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User u = (User) session.getAttribute("user");
            isSubscribed = subDAO.isSubscribed(u.getUserId(), video.getUser().getUserId());
        }
        request.setAttribute("isSubscribed", isSubscribed);

        request.getRequestDispatcher("videodetail.jsp").forward(request, response);
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

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User u = (User) session.getAttribute("user");
        int videoId = Integer.parseInt(request.getParameter("videoId"));
        String content = request.getParameter("content");

        String action = request.getParameter("action");
        if ("editComment".equals(action)) {
            int commentId = Integer.parseInt(request.getParameter("commentId"));
            if (content != null && !content.trim().isEmpty()) {
                new CommentDAO().updateComment(commentId, content.trim());
            }
        } else if ("deleteComment".equals(action)) {
            int commentId = Integer.parseInt(request.getParameter("commentId"));
            new CommentDAO().deleteComment(commentId);
        } else {
            if (content != null && !content.trim().isEmpty()) {
                new CommentDAO().addComment(videoId, u.getUserId(), content.trim());
            }
        }

        response.sendRedirect("videodetail?id=" + videoId);
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
