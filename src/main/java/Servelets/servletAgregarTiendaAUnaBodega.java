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
@WebServlet(name = "servletAgregarTiendaAUnaBodega", urlPatterns = {"/servletAgregarTiendaAUnaBodega"})
public class servletAgregarTiendaAUnaBodega extends HttpServlet {

   
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigoUsuario = request.getParameter("codigoUsuario");
        String codigoTienda = request.getParameter("combobox");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           Conexion.guardarTiendadeBodega(Integer.parseInt(codigoUsuario), Integer.parseInt(codigoTienda));
           out.print("<form class=\"d-flex\" action=\"DelAdministrador/nuevaTiendaAUsuarioBodega.jsp\" method=\"POST\"> "
                   + "<input type=\"hidden\" name=\"codigo\" value=\""+codigoUsuario+">"
                   + "</form> ");
           
        }
    }


}
