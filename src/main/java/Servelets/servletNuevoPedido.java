/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servelets;

import SQL.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
 * @author HP
 */
@WebServlet(name = "servletNuevoPedido", urlPatterns = {"/servletNuevoPedido"})
public class servletNuevoPedido extends HttpServlet {

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
            HttpSession sesion = request.getSession();
            int codigoTienda = Integer.parseInt(sesion.getAttribute("tienda").toString());
            int codigoUsuario = Integer.parseInt(sesion.getAttribute("id").toString());
            String tipoTienda = "normal";
            Conexion.traerTiendaPorId(codigoTienda);
            try {
                while (Conexion.rs.next()) {
                    tipoTienda = Conexion.rs.getString("tipo");

                }
                //out.print(sesion.getAttribute("id") + "Tienda: " + sesion.getAttribute("tienda"));
            } catch (SQLException ex) {
                Logger.getLogger(servletNuevoPedido.class.getName()).log(Level.SEVERE, null, ex);
            }
            String estado ="SOLICITADO";
            if(tipoTienda.equalsIgnoreCase("supervisada")){
                estado = "PENDIENTE";
            }
            //Conexion.guardarPedidoRealizado(codigoUsuario, codigoTienda, tipoTienda, tipoTienda, codigoTienda);
            Conexion.guardarPedidoRealizado(codigoUsuario, codigoTienda, FechaFull(), estado, 0.0);
            response.sendRedirect("DelTienda/NuevoPedido.jsp");
        }
    }

    public  String FechaFull() {
        Calendar calendario = new GregorianCalendar();
        return  String.valueOf(calendario.get(Calendar.YEAR)
                +"-" + String.valueOf(calendario.get(Calendar.MONTH)+1)
                + "-" +String.valueOf(calendario.get(Calendar.DAY_OF_MONTH)));
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
