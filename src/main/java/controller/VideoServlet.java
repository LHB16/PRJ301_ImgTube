/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.VideoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Category;
import model.User;
import model.Video;

/**
 *
 * @author GIGABYTE
 */
@WebServlet(name = "AddVideo", urlPatterns = {"/video"})
public class VideoServlet extends HttpServlet {

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
            out.println("<title>Servlet AddVideo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddVideo at " + request.getContextPath() + "</h1>");
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
        CategoryDAO daoCate = new CategoryDAO();
        VideoDAO daoVideo = new VideoDAO();

        String action = request.getParameter("action");
        if (request.getParameter("id") != null) {
            int userId = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("videos", daoVideo.getActiveVideosByID(userId));
//            request.setAttribute("categories", daoCate.getAllCategories());
            request.getRequestDispatcher("videouser.jsp").forward(request, response);
            return;
        }

        if (action == null) {
            action = "all";
        }

        if (action.equalsIgnoreCase("add")) {
            List<Category> listCate = daoCate.getAllCategories();
            request.setAttribute("listCate", listCate);
            request.getRequestDispatcher("addvideo.jsp").forward(request, response);
            return;
        }

        if (action.equalsIgnoreCase("update")) {
            int videoid = Integer.parseInt(request.getParameter("videoid"));
            Video video = daoVideo.getVideoById(videoid);
            List<Category> listCate = daoCate.getAllCategories();
            request.setAttribute("listCate", listCate);
            request.setAttribute("video", video);
            request.getRequestDispatcher("updatevideo.jsp").forward(request, response);
            return;
        }

        if (action.equalsIgnoreCase("delete")) {
            int videoid = Integer.parseInt(request.getParameter("videoid"));
            Video video = daoVideo.getVideoById(videoid);
            request.setAttribute("video", video);
            request.getRequestDispatcher("deletevideo.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        VideoDAO dao = new VideoDAO();

        User u = (User) session.getAttribute("user");

        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("add")) {
            String title = request.getParameter("title");
            String des = request.getParameter("description");
            String url = request.getParameter("urlVideo");
            int cateID = Integer.parseInt(request.getParameter("categoryId"));
            Boolean res = dao.insert(title, des, url, u.getUserId(), cateID);
            response.sendRedirect("home");
            return;
        }

        if (action.equalsIgnoreCase("update")) {
            int videoid = Integer.parseInt(request.getParameter("videoid"));
            String title = request.getParameter("title");
            String des = request.getParameter("description");
            String url = request.getParameter("urlVideo");
            int cateID = Integer.parseInt(request.getParameter("categoryId"));
            Boolean res = dao.update(videoid, title, des, url, cateID);
            response.sendRedirect("home");
            return;
        }

        if (action.equalsIgnoreCase("delete")) {
            int videoid = Integer.parseInt(request.getParameter("videoid"));
            Boolean res = dao.delete(videoid);
            response.sendRedirect("home");
            return;
        }
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
