package Servelets;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Encriptacion.Encriptacion;
import SQL.Conexion;
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
 * @author HP
 */
@WebServlet(urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Encriptacion encriptar = new Encriptacion();
        Conexion.conectar();
        int area = 1;
        if (request.getParameter("combobox") != null) {
            area = Integer.parseInt(request.getParameter("combobox"));
        }
        if (request.getParameter("boton") != null) {

            try {
                int id = Integer.parseInt(request.getParameter("IDusuario"));
                String contraseña = request.getParameter("password");

                HttpSession sesion = request.getSession();
                Conexion.verificarUsuario(id, encriptar.getMD5(contraseña), area);
                System.out.println(id);
                System.out.println(encriptar.getMD5(contraseña));
                System.out.println(area);
                while (Conexion.rs.next()) {
                    System.out.println("entrando en el while");
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("user", Conexion.rs.getString("nombre_usuario"));
                    sesion.setAttribute("id", Conexion.rs.getString("codigo_usuario"));
                    sesion.setAttribute("area", Conexion.rs.getString("area"));
                    sesion.setAttribute("activo", Conexion.rs.getString("activo"));
                    if (sesion.getAttribute("activo").equals("0")) {
                        out.print("<div class=\"alert alert-danger\" role=\"alert\">#Tu usuario esta inactivo reportate con el administrador</div>");
                    } else {
                        switch (area) {
                            case 1:
                                response.sendRedirect("AreaAdministrador.jsp");
                                break;
                            case 3:
                                Conexion.traerUsuarioTiendaPorId(Integer.parseInt((String) sesion.getAttribute("id")));

                                try {
                                    while (Conexion.rs.next()) {
                                        sesion.setAttribute("tienda", Conexion.rs.getString(2));
                                        System.out.println("tienda: " + Conexion.rs.getString(2));
                                        response.sendRedirect("AreaTienda.jsp");
                                    }

                                    //response.sendRedirect("DelTienda/NuevoPedido.jsp");
                                } catch (SQLException ex) {
                                    Logger.getLogger(servletNuevoPedido.class.getName()).log(Level.SEVERE, null, ex);

                                }
                                out.print("Tu usuario no tiene ninguna tienda agregada, comunicate con tu admnistrador ");
                                break;
                            case 4:
                                System.out.println("Entrando en el area 4");
                                response.sendRedirect("AreaSupervisor.jsp");
                                break;
                            case 2:
                                response.sendRedirect("AreaBodega.jsp");
                                break;
                            default:
                                out.print("*Usuario no valido#");
                                break;
                        }
                    }

                }
                out.print("*Usuario no valido*");
            } catch (SQLException ex) {
                Logger.getLogger(ServletLogin.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

}
