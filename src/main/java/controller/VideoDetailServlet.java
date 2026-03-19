/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

<<<<<<< HEAD
import dao.CommentDAO;
import dao.SubscriptionDAO;
import dao.VideoDAO;
=======
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Comment;
import model.User;
import model.Video;
=======
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d

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
<<<<<<< HEAD

        String id = request.getParameter("id");
        if (id == null) {
            response.sendRedirect("home");
            return;
        }

        int videoId = Integer.parseInt(id);

        VideoDAO videoDAO = new VideoDAO();
        CommentDAO commentDAO = new CommentDAO();
        SubscriptionDAO subscriptionDAO = new SubscriptionDAO();

        Video video = videoDAO.getVideoById(videoId);
        if (video == null) {
            response.sendRedirect("home");
            return;
        }

        List<Comment> comments = commentDAO.getCommentsByVideoId(videoId);
        int subscriberCount = subscriptionDAO.countSubscribers(video.getUser().getUserId());

        boolean isSubscribed = false;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            User currentUser = (User) session.getAttribute("account");
            isSubscribed = subscriptionDAO.isSubscribed(
                    currentUser.getUserId(), video.getUser().getUserId()
            );
        }

        request.setAttribute("video", video);
        request.setAttribute("comments", comments);
        request.setAttribute("subscriberCount", subscriberCount);
        request.setAttribute("isSubscribed", isSubscribed);
        request.getRequestDispatcher("videodetail.jsp").forward(request, response);
=======
        processRequest(request, response);
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
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
<<<<<<< HEAD

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("account");
        int videoId = Integer.parseInt(request.getParameter("videoId"));
        String content = request.getParameter("content");

        if (content != null && !content.trim().isEmpty()) {
            new CommentDAO().addComment(videoId, currentUser.getUserId(), content.trim());
        }
        response.sendRedirect("videodetail?id=" + videoId);
=======
        processRequest(request, response);
>>>>>>> 985618be4eb3e81521557505b6449ec8d8451a0d
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
