/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servelets;

import SQL.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
@WebServlet(name = "servletTablaUsuariosBodegas", urlPatterns = {"/servletTablaUsuariosBodegas"})
public class servletTablaUsuariosBodegas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ResultSet resultado = Conexion.traerUsuarioBodega();
            while (resultado.next()) {
                String estado = "inactivo";
                if (resultado.getString("activo").equals("1")) {
                    estado = "activo";
                }
                String area = null;
                int numArea = Integer.parseInt(resultado.getString("area"));
                switch (numArea) {
                    case 1:
                        area = "Administracion";
                        break;
                    case 2:
                        area = "Bodega";
                        break;
                    case 3:
                        area = "Tienda";
                        break;
                    case 4:
                        area = "Supervisor";
                        break;
                    default:
                        break;

                }
                System.out.println("VAMOS EN AGREGANDO AL BODY");
                out.print("<tr>\n"
                        + "                                    <th scope=\"col\">" + resultado.getString(1) + "</th>\n"
                        + "                                    <th scope=\"col\">" + resultado.getString(2) + "</th>\n"
                        + "                                    <th scope=\"col\">" + resultado.getString(3) + "</th>\n"
                        + "                                    <th scope=\"col\">" + resultado.getString(4) + "</th>\n"
                        + "                                    <th scope=\"col\">" + area + "</th>\n"
                        + "                                    <th scope=\"col\">" + estado + "</th>\n"
                        + "                                    <td>"
                        + "                                             <img src=\"https://img.icons8.com/ios-filled/30/null/plus-2-math.png\"/>"
                        + "                                     </td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServletTablaUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
