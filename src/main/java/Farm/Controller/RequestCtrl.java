/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Farm.Controller;

import Farm.Model.RequestDB;
import Farm.Model.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
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
@WebServlet(name = "RequestCtrl", urlPatterns = {"/RequestCtrl"})
public class RequestCtrl extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String submit = request.getParameter("Action");
        RequestDB r = new RequestDB();
        Date today = new Date();
        HttpSession session = request.getSession();
        if (submit.equals("Request")) {
            String name = (String) session.getAttribute("user");
            String cname = request.getParameter("cname");
            String desc = request.getParameter("desc");
            String type = request.getParameter("type");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            double totalPrice = price * quantity;
            r = new RequestDB(today.toString(), name, type, cname, desc, "New", quantity, totalPrice);
            try {
                r.addRequest();
                request.setAttribute("msg", "Request " + cname + " Done Successfully");
                if (type.equals("Crop")) {
                    request.getRequestDispatcher("viewCrops.jsp").forward(request, response);
                } else if (type.equals("Equipment")) {
                    request.getRequestDispatcher("viewEquipments.jsp").forward(request, response);
                } else if (type.equals("Insecticide")) {
                    request.getRequestDispatcher("viewInsecticides.jsp").forward(request, response);
                } else if (type.equals("Fertilizer")) {
                    request.getRequestDispatcher("viewFertilizers.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                request.setAttribute("err", ex);
                if (type.equals("Crop")) {
                    request.getRequestDispatcher("viewCrops.jsp").forward(request, response);
                } else if (type.equals("Equipment")) {
                    request.getRequestDispatcher("viewEquipments.jsp").forward(request, response);
                } else if (type.equals("Insecticide")) {
                    request.getRequestDispatcher("viewInsecticides.jsp").forward(request, response);
                } else if (type.equals("Fertilizer")) {
                    request.getRequestDispatcher("viewFertilizers.jsp").forward(request, response);
                }
            }
        } else if (submit.equals("Assign")) {
            String time = request.getParameter("time");
            String choice = request.getParameter("choice");
            try {
                r.updateStatus(time, "In Progress", choice);
                request.getRequestDispatcher("viewCurrReqA.jsp").include(request, response);
                out.println("<script language='JavaScript'>\n"
                        + "            Swal.fire('Good job!', \"Supplier Assigned Successfully\",'success');\n"
                        + "            \n"
                        + "        </script>");
            } catch (SQLException ex) {
                request.getRequestDispatcher("viewCurrReqA.jsp").include(request, response);
                out.println("<script>\n"
                        + "            Swal.fire('Good job!', " + ex + ",'error')\n"
                        + "            \n"
                        + "        </script>");
            }
        } else if (submit.equals("Accept")) {
            String time = request.getParameter("time");
            try {
                r.updateStatus(time, "Accepted", (String) session.getAttribute("supplier"));
                request.getRequestDispatcher("viewCurrReqA.jsp").include(request, response);
                out.println("<script language='JavaScript'>\n"
                        + "            Swal.fire('Good job!', \"Request Accepted Successfully\",'success');\n"
                        + "            \n"
                        + "        </script>");
            } catch (SQLException ex) {
                request.getRequestDispatcher("viewCurrReqA.jsp").include(request, response);
                out.println("<script>\n"
                        + "            Swal.fire('Good job!', " + ex + ",'error')\n"
                        + "            \n"
                        + "        </script>");
            }
        } else if (submit.equals("Reject")) {
            String time = request.getParameter("time");
            try {
                r.updateStatus(time, "Rejected");
                request.getRequestDispatcher("viewCurrReqA.jsp").include(request, response);
                out.println("<script language='JavaScript'>\n"
                        + "            Swal.fire('Good job!', \"Request Rejected Successfully\",'success');\n"
                        + "            \n"
                        + "        </script>");
            } catch (SQLException ex) {
                request.getRequestDispatcher("viewCurrReqA.jsp").include(request, response);
                out.println("<script>\n"
                        + "            Swal.fire('Error!', " + ex + ",'error')\n"
                        + "            \n"
                        + "        </script>");
            }
        } else if (submit.equals("Delivered")) {
            String time = request.getParameter("time");
            try {
                r.updateStatus(time, "Delivered");
                request.getRequestDispatcher("viewCurrReqF.jsp").include(request, response);
                out.println("<script language='JavaScript'>\n"
                        + "            Swal.fire('Thank you!', \"Request Delivered Successfully\",'success');\n"
                        + "            \n"
                        + "        </script>");
            } catch (SQLException ex) {
                request.getRequestDispatcher("viewCurrReqF.jsp").include(request, response);
                out.println("<script>\n"
                        + "            Swal.fire('Error!', " + ex + ",'error')\n"
                        + "            \n"
                        + "        </script>");
            }
        } else if (submit.equals("Corrupted")) {
            String time = request.getParameter("time");
            try {
                r.updateStatus(time, "Corrupted");
                request.getRequestDispatcher("viewCurrReqF.jsp").include(request, response);
                out.println("<script language='JavaScript'>\n"
                        + "            Swal.fire('Thank you!', \"Request Corrupted Successfully\",'success');\n"
                        + "        </script>");
            } catch (SQLException ex) {
                request.getRequestDispatcher("viewCurrReqF.jsp").include(request, response);
                out.println("<script>\n"
                        + "            Swal.fire('Error!', " + ex + ",'error')\n"
                        + "            \n"
                        + "        </script>");
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
