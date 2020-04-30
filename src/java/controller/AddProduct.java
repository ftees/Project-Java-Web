/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Phone;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modal.productDB;

/**
 *
 * @author Giang
 */
@WebServlet(name = "AddProduct", urlPatterns = {"/AddProduct"})
public class AddProduct extends HttpServlet {

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
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String id = request.getParameter("id").trim();
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String image = "img/".concat(request.getParameter("image"));
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String status = request.getParameter("status");
        String adddate = request.getParameter("adddate");
        String describe = request.getParameter("describe");
        String ms = "Ok";

        System.out.println(id + name);

        productDB pdb = new productDB();

        if (id == null || id.length() == 0) {
            ms = "id is null";
            request.setAttribute("error", ms);
            RequestDispatcher re = request.getRequestDispatcher("AddNewProduct.jsp");
            re.forward(request, response);
        } else if (name == null || name.length() == 0) {
            ms = "name is null";
            request.setAttribute("error", ms);
            RequestDispatcher re = request.getRequestDispatcher("AddNewProduct.jsp");
            re.forward(request, response);
        } else if (brand == null || brand.length() == 0) {
            ms = "describe is null";
            request.setAttribute("error", ms);
            RequestDispatcher re = request.getRequestDispatcher("AddNewProduct.jsp");
            re.forward(request, response);
        } else if (image == null || image.length() == 0) {
            ms = "describe is null";
            request.setAttribute("error", ms);
            RequestDispatcher re = request.getRequestDispatcher("AddNewProduct.jsp");
            re.forward(request, response);
        } else if (describe == null || describe.length() == 0) {
            ms = "describe is null";
            request.setAttribute("error", ms);
            RequestDispatcher re = request.getRequestDispatcher("AddNewProduct.jsp");
            re.forward(request, response);
        } else if (adddate == null || adddate.length() == 0) {
            ms = "describe is null";
            request.setAttribute("error", ms);
            RequestDispatcher re = request.getRequestDispatcher("AddNewProduct.jsp");
            re.forward(request, response);
        } else {
            if (!pdb.exsittedProduct(id)) {
                Phone p = new Phone(id, name, brand, image, price, quantity, status, adddate,describe);
                System.out.println(p);
                pdb.insert(p);
                response.sendRedirect("admin.jsp");
            } else {
                ms = id + " is exsited";
                request.setAttribute("error", ms);
                RequestDispatcher re = request.getRequestDispatcher("AddNewProduct.jsp");
                re.forward(request, response);
            }
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
