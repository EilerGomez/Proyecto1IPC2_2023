/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servelets;

import SQL.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "ServletEditarUsuario", urlPatterns = {"/ServletEditarUsuario"})
public class ServletEditarUsuario extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("guardarUsuario")!=null){
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String name = (request.getParameter("nombre"));
            String nombreUsuario = (request.getParameter("nombreUsuario"));
            String correo = (request.getParameter("correo"));
            String estado = (request.getParameter("comboboxEstado"));            
            int area = Integer.parseInt(request.getParameter("comboboxArea"));
            int activo = Integer.parseInt(estado);
            System.out.println(codigo + ", " + name +", "+ nombreUsuario +", " + correo + ", " + area + ", " + activo );
            Conexion.actualizarUsuario(codigo, name, nombreUsuario, correo, area, activo);
            response.sendRedirect("AreaAdministrador.jsp");
        }
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
