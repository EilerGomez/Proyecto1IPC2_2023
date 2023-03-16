/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servelets;

import Encriptacion.Encriptacion;
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
@WebServlet(name = "ServletAgregarUsuario", urlPatterns = {"/DelAdministrador/ServletAgregarUsuario"})
public class ServletAgregarUsuario extends HttpServlet {
    Encriptacion encriptar = new Encriptacion();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        if (request.getParameter("guardarUsuario") != null) {
            if (!request.getParameter("password1").equals(request.getParameter("password2"))) {
                out.print("las contraseñas no coinciden");
            } else {
                String nombre = request.getParameter("nombre");
                String nombreUsuario = request.getParameter("nombreUsuario");
                String correo = request.getParameter("correo");
                String password = request.getParameter("password1");
                String area = request.getParameter("combobox");
                String estado = request.getParameter("comboEstado");
                Conexion.guardarUsuarioNuevo(nombre, nombreUsuario, correo, encriptar.getMD5(password), Integer.parseInt(area), Integer.parseInt(estado));
                response.sendRedirect("../AreaAdministrador.jsp");
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
