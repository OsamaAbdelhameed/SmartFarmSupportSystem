/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Farm.Controller;

import Farm.Model.EquipmentDB;
import Farm.Model.FertilizerDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author OSAMA
 */
@WebServlet(name = "FertilizerCtrl", urlPatterns = {"/FertilizerCtrl"})
public class FertilizerCtrl extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String submit = (String) request.getParameter("Action");
        FertilizerDB f = new FertilizerDB();
        HttpSession session = request.getSession();
        /* TODO output your page here. You may use following sample code. */
        if (submit.equals("Add")) {
            String fname = request.getParameter("fname");
            String pname = request.getParameter("pname");
            int range = Integer.parseInt(request.getParameter("range"));
            double p = Double.parseDouble(request.getParameter("price"));
            String enable = (request.getParameter("enabled") != null)?request.getParameter("enabled"):"off";
            String img = request.getParameter("image");//out.println("After ParseDouble  " +cname+desc+startMonth+endMonth+season+ price+img  + "/");
            String desc = request.getParameter("desc");
            f = new FertilizerDB(fname, pname, img, desc, enable, range, p);
            try {
                f.addFertilizer();
                session.setAttribute("msg", "Fertilizer Added Successfully");
                response.sendRedirect("addView.jsp");
            } catch (SQLException ex) {
                session.setAttribute("err", ex);
                response.sendRedirect("addView.jsp");
            }
        } else if (submit.equals("Edit")) {
            String editedName = (String) session.getAttribute("editedFert");
            String fname = request.getParameter("fname");
            String pname = request.getParameter("pname");
            String enable = (request.getParameter("enabled") != null)?request.getParameter("enabled"):"off";
            int range = Integer.parseInt(request.getParameter("range"));
            double p = Double.parseDouble(request.getParameter("price"));
            String img = request.getParameter("image");//out.println("After ParseDouble  " +cname+desc+startMonth+endMonth+season+ price+img  + "/");
            String desc = request.getParameter("desc");
            f = new FertilizerDB(fname, pname, img, desc, enable, range, p);
            try {
                f.editFertilizer(editedName);
                session.setAttribute("msg", "Fertilizer Editted Successfully");
                response.sendRedirect("editView.jsp");
            } catch (SQLException ex) {
                session.setAttribute("err", ex);
                response.sendRedirect("editView.jsp");
            }
        } else if (submit.equals("Delete")) {
            String choice = request.getParameter("choice");
            try {
                f.deleteFertilizer(choice);
                session.setAttribute("msg", "Fertilizer Deleted Successfully");
                response.sendRedirect("deleteView.jsp");
            } catch (SQLException ex) {
                session.setAttribute("err", ex);
                response.sendRedirect("deleteView.jsp");
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
