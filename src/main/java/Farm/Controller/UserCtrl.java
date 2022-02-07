/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Farm.Controller;
import Farm.Model.UserDB;

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
@WebServlet(name = "UserCtrl", urlPatterns = {"/UserCtrl"})
public class UserCtrl extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        String submit = request.getParameter("Action");
        UserDB u = new UserDB();
        HttpSession session=request.getSession();
        try (PrintWriter out = response.getWriter()) {
            if(submit.equals("Sign Up")){
                String name=request.getParameter("name");
                String role=request.getParameter("role");
		String uname=request.getParameter("uname");
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("pass");
		String cpass=request.getParameter("cpass");
		String email=request.getParameter("email");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String address=request.getParameter("address");
                
                if(!u.isValidName(name)){
			request.getRequestDispatcher("register.jsp").include(request, response);
                        out.println("<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', \"Please enter only characters in name input field.\",'error');\n" +
        "        </script>");
		}else if(!u.isValidName(uname)){
			request.getRequestDispatcher("register.jsp").include(request, response);
                        out.println("<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', \"Please enter only characters in user name input field.\",'error');\n" +
        "        </script>");
		}else if(!cpass.equals(password)){
			request.setAttribute("password","Please Match Both the password");
			request.getRequestDispatcher("register.jsp").include(request, response);
                        out.println("<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', \"Password and confirm password aren't same.\",'error');\n" +
        "        </script>");
		}else if(!u.isValidName(city)){
			request.getRequestDispatcher("register.jsp").include(request, response);
                        out.println("<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', \"Please enter only characters in city input field.\",'error');\n" +
        "        </script>");
		}else{
                    HttpSession httpSession=request.getSession();
                    try {
                        int r = (role.equals("Farmer")) ? 2 : (role.equals("Supplier")) ? 3 : 0; 
                        u = new UserDB(name, uname, password, mobile, city, state, address, email, r);
                        u.register();
                        request.getRequestDispatcher("register.jsp").include(request, response);
                        out.println("<script language='JavaScript'>\n" +
        "            Swal.fire('Good job!', \"Registerd Successfully.\",'success');\n" +
        "        </script>");
                    } catch (SQLException e) {
			request.getRequestDispatcher("register.jsp").include(request, response);
                        out.println("<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', "+e+",'error');\n" +
        "        </script>");
                    }
		}
            }else if(submit.equals("Login")){
                String username=request.getParameter("uname");
		String pass=request.getParameter("pass");
                
                u.setUsername(username);
                u.setPassword(pass);
                out.println("crossed login");
                String result = "";
                try{
                    result = u.login();
                }catch(Exception ex){
                        response.sendRedirect("login.jsp");
                        session.setAttribute("msg","<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', "+ex+",'error');\n" +
        "        </script>");
                }
                switch (result) {
                    case "ADMIN_ROLE":
                        response.sendRedirect("userhome.jsp");
                        session.setAttribute("msg","<script language='JavaScript'>\n" +
        "            Swal.fire('Good job!', \"Logged In Successfully.\",'success');\n" +
        "        </script>");
                        session.setAttribute("admin", username);
                        break;
                    case "CUSTOMER_ROLE":
                        try{
                            u.logHistory(username);
                        }catch(Exception ex){
                        response.sendRedirect("login.jsp");
                        session.setAttribute("msg","<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', "+ex+",'error');\n" +
        "        </script>");
                        }
                        session.setAttribute("user", username);
                        response.sendRedirect("userhome.jsp");
                        session.setAttribute("msg","<script language='JavaScript'>\n" +
        "            Swal.fire('Good job!', \"Logged In Successfully.\",'success');\n" +
        "        </script>");
                        break;
                    case "SUPPLIER_ROLE":
                        try{
                            u.logHistory(username);
                        }catch(Exception ex){
                        response.sendRedirect("login.jsp");
                        session.setAttribute("msg","<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', "+ex+",'error');\n" +
        "        </script>");
                        }
                        session.setAttribute("supplier", username);
                        response.sendRedirect("userhome.jsp");
                        session.setAttribute("msg","<script language='JavaScript'>\n" +
        "            Swal.fire('Good job!', \"Logged In Successfully.\",'success');\n" +
        "        </script>");
                        break;
                    case "INVALID":
                        response.sendRedirect("login.jsp");
                        session.setAttribute("msg","<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', 'Log In Failed','error');\n" +
        "        </script>");
//                        request.getRequestDispatcher("login.jsp").include(request, response);
                        out.println("<script language='JavaScript'>\n" +
        "            Swal.fire('Error!', 'Log In Failed','error');\n" +
        "        </script>");
                        break;
                    default:
                        break;
                }
            } else if(submit.equals("Update")){
                String updatedUser = (String) session.getAttribute("updatedUser");
                String name=request.getParameter("name");
		int role= Integer.parseInt(request.getParameter("role"));
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("pass");
		String cpass=request.getParameter("cpass");
		String email=request.getParameter("email");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String address=request.getParameter("address");
                
                if(!u.isValidName(name)){
			request.setAttribute("err","Please enter Only characters for Name");
			request.getRequestDispatcher("ChangeUser.jsp").forward(request, response);
		}else if(!cpass.equals(password)){
			request.setAttribute("err","Please Match Both the passwords");
			request.getRequestDispatcher("ChangeUser.jsp").forward(request, response);
		}else if(!u.isValidName(city)){
			request.setAttribute("err","Please enter Only characters for city");
			request.getRequestDispatcher("ChangeUser.jsp").forward(request, response);
		}else{
                    HttpSession httpSession=request.getSession();
                    try {
                        u = new UserDB(name, updatedUser, password, mobile, city, state, address, email, role);
                        u.Update(updatedUser);
                        String msg="Updated Successfully";
                        request.setAttribute("msg", msg);
                        request.getRequestDispatcher("ChangeUser.jsp").forward(request, response);
                    } catch (Exception e) {
                        request.setAttribute("err", e);
                        request.getRequestDispatcher("ChangeUser.jsp").forward(request, response);
                    }
		}
            }else if(submit.equals("Logout")){
                session.removeAttribute("admin");
                session.removeAttribute("user");
                session.removeAttribute("supplier");
		request.getRequestDispatcher("login.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserCtrl.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserCtrl.class.getName()).log(Level.SEVERE, null, ex);
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
