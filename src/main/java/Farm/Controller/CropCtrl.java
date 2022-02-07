/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Farm.Controller;

import Farm.Model.CropDB;
import Farm.Model.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author OSAMA
 */
@WebServlet(name = "CropCtrl", urlPatterns = {"/CropCtrl"})
public class CropCtrl extends HttpServlet {

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            System.out.println(ex);
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String submit = (String) request.getParameter("Action");
        CropDB c = new CropDB();
        HttpSession session = request.getSession();

        if (submit.equals("Add")) {
            String cname = request.getParameter("cname");
            String desc = request.getParameter("desc");
            String startMonth = request.getParameter("startmonth");
            String endMonth = request.getParameter("endmonth");
            String season = request.getParameter("season");//out.println("entered add in cropCtrl  " + "/");
            String price = request.getParameter("price");
            String enable = (request.getParameter("enabled") != null)?request.getParameter("enabled"):"off";
            String img = request.getParameter("image");//out.println("After ParseDouble  " +cname+desc+startMonth+endMonth+season+ price+img  + "/");
            double p = Double.parseDouble(price);
            c = new CropDB(cname, startMonth, endMonth, season, img, desc, enable, p);
            try {
                c.addCrop();
                session.setAttribute("msg", "Crop Added Successfully");
                response.sendRedirect("addView.jsp");
            } catch (SQLException ex) {
                session.setAttribute("err", ex);
                response.sendRedirect("addView.jsp");
            }
        } else if (submit.equals("Edit")) {
            String editedName = (String) session.getAttribute("editedCrop");
            String cname = request.getParameter("cname");
            String desc = request.getParameter("desc");
            String startMonth = request.getParameter("startmonth");
            String endMonth = request.getParameter("endmonth");
            String season = request.getParameter("season");//out.println("entered add in cropCtrl  " + "/");
            String price = request.getParameter("price");
            String enable = (request.getParameter("enabled") != null)?request.getParameter("enabled"):"off";
            String img = request.getParameter("image");//out.println("After ParseDouble  " +cname+desc+startMonth+endMonth+season+ price+img  + "/");
            double p = Double.parseDouble(price);
            c = new CropDB(cname, startMonth, endMonth, season, img, desc, enable, p);
            try {
                c.editCrop(editedName);
                session.setAttribute("msg", "Crop Edited Successfully");
                response.sendRedirect("editView.jsp");
            } catch (SQLException ex) {
                session.setAttribute("err", ex);
                response.sendRedirect("editView.jsp");
            }
        } else if (submit.equals("Delete")) {
            String choice = request.getParameter("choice");
            try {
                c.deleteCrop(choice);
                session.setAttribute("msg", "Crop Deleted Successfully");
                response.sendRedirect("deleteView.jsp");
            } catch (SQLException ex) {
                session.setAttribute("err", ex);
                response.sendRedirect("deleteView.jsp");
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
