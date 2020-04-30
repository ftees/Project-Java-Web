/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customer;
import entity.Item;
import entity.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.productDB;

/**
 *
 * @author Giang
 */
@WebServlet(name = "shopping", urlPatterns = {"/shopping"})
public class shopping extends HttpServlet {

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
        productDB pdb = new productDB();
        HttpSession session = request.getSession(true);
        String quantity =(request.getParameter("quantity"));
        int qua = Integer.parseInt(quantity);
        String id = request.getParameter("id");
        int price = Integer.parseInt(request.getParameter("price"));
        Customer c = (Customer) session.getAttribute("customer");
        String cusId = c.getCusID();
        String oid = id+"_"+cusId;
        System.out.println(cusId +" "+id+" "+oid);
        
        int totalPrice = qua * price;
        Order o = new Order(cusId,oid,id ,qua, totalPrice);
            pdb.insertOrder(o);
        if (session.getAttribute("customer") != null) {
            request.setAttribute("quan", quantity);
            request.setAttribute("idbuy", id);
            
            RequestDispatcher re = request.getRequestDispatcher("ProductPage?idbuy=" + id);
            re.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
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
