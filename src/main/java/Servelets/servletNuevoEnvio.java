/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servelets;

import SQL.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author HP
 */
@WebServlet(name = "servletNuevoEnvio", urlPatterns = {"/servletNuevoEnvio"})
public class servletNuevoEnvio extends HttpServlet {

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
            PrintWriter out = response.getWriter();
            /*        try {
            processRequest(request, response);
            PrintWriter out = response.getWriter();
            request.getSession().setAttribute("idPedido", request.getParameter("idPedido"));
            request.getSession().setAttribute("tienda", request.getParameter("tienda"));
            int tienda = Integer.parseInt(request.getParameter("tienda"));
            int usuario = Integer.parseInt(request.getSession().getAttribute("id").toString());
            Conexion.crearNuevoEnvio(usuario, tienda, FechaFull(), 0.0);
            System.out.println("envio creado");
            Conexion.traerUltimoEnvioPorUsuario(usuario);
            while (Conexion.rs.next()) {
            System.out.println("entrando en el while");
            request.getSession().setAttribute("idEnvio", Conexion.rs.getString(1));
            //response.sendRedirect("DelBodega/nuevoEnvio.jsp");
            }
            out.print("listo para enviar");
            
            } catch (SQLException ex) {
            Logger.getLogger(servletNuevoEnvio.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error");
            }*/
            
            request.getSession().setAttribute("idPedido", request.getParameter("idPedido"));
            request.getSession().setAttribute("tienda", request.getParameter("tienda"));
            int tienda = Integer.parseInt(request.getParameter("tienda"));
            int usuario = Integer.parseInt(request.getSession().getAttribute("id").toString());
            out.println("Hola Servlet");
            Conexion.crearNuevoEnvio(usuario, tienda, FechaFull(), 0.0);
            out.println("envio creado");
            Conexion.traerUltimoEnvioPorUsuario(usuario);
            out.println("ultimo envio traido");
            while(Conexion.rs.next()){
                
                request.getSession().setAttribute("idEnvio", Conexion.rs.getString(1));
                out.print(request.getSession().getAttribute("idEnvio"));
            }
            response.sendRedirect("DelBodega/nuevoEnvio.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(servletNuevoEnvio.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public String FechaFull() {
        Calendar calendario = new GregorianCalendar();
        return String.valueOf(calendario.get(Calendar.YEAR)
                + "-" + String.valueOf(calendario.get(Calendar.MONTH) + 1)
                + "-" + String.valueOf(calendario.get(Calendar.DAY_OF_MONTH)));
    }

}
