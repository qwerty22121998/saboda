/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Book;

/**
 *
 * @author qwert
 */
public class booked extends HttpServlet {

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
            request.setCharacterEncoding("utf-8");

            if (request.getParameter("id") != null) {
                Book.Pay(request.getParameter("id"));
                response.sendRedirect("detail.jsp?id=" + request.getParameter("id"));
            }

            String fieldID = request.getParameter("fieldID");
            String name = request.getParameter("name");
            String note = request.getParameter("note");
            String phone = request.getParameter("phone");
            String date = request.getParameter("date");
            String from = request.getParameter("from");
            String time = request.getParameter("time");
            String price = request.getParameter("price");
            
            int to = Integer.parseInt(from) + Integer.parseInt(time);
            
            Book book = new Book();
            book.fieldID = Integer.parseInt(fieldID);
            book.name = name;
            book.phone = phone;
            book.note = note;
            book.from = Integer.parseInt(from);
            book.to = to;
            book.status = false;
            book.price = price;
            book.date = date;
            book.Place();
            response.sendRedirect("detail.jsp?id=" + book.id);

        } catch (Exception e) {

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
