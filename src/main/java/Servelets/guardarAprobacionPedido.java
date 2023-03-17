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
@WebServlet(name = "guardarAprobacionPedido", urlPatterns = {"/guardarAprobacionPedido"})
public class guardarAprobacionPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        if (request.getParameter("aceptarRechazo") != null) {
            String mensaje = request.getParameter("mensaje");
            int idPedido = Integer.parseInt(request.getParameter("idPedido"));
            Conexion.actualizarEstadoDelPedido(idPedido, mensaje, "RECHAZADO");
            response.sendRedirect("AreaSupervisor.jsp");
        }

        if (request.getParameter("aceptarPedido") != null) {
            int idPedido = Integer.parseInt(request.getParameter("idPedido"));
            Conexion.actualizarEstadoDelPedido(idPedido, "Por defecto o por revisar", "SOLICITADO");
            response.sendRedirect("AreaSupervisor.jsp");
        }
    }

}
