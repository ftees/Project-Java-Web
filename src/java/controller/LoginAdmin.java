/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Admin;
import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.AdminDB;
import modal.CustomerDB;

/**
 *
 * @author TienNp
 */
public class LoginAdmin extends HttpServlet {

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
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String rem = request.getParameter("remember");
        HttpSession session = request.getSession(true);
        AdminDB cdb = new AdminDB();
        Admin a = cdb.getAdmin(username, password);
        if(a==null){
            String err = "Username "+username+" is invalid !";
            request.setAttribute("error", err);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            Cookie cuser = new Cookie("username", username);
            Cookie cpass = new Cookie("pass", password);
            Cookie crem = new Cookie("remember", rem);
            if(rem!=null){
                cuser.setMaxAge(60*60*60);
                cpass.setMaxAge(60*60*60);
                crem.setMaxAge(60*60*60);
            }else{
                 cuser.setMaxAge(0);
                 cpass.setMaxAge(0);
                 crem.setMaxAge(0);
            }
            response.addCookie(cuser);
            response.addCookie(cpass);
            response.addCookie(crem);
            session.setAttribute("admin", a);
            response.sendRedirect("admin.jsp");
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
