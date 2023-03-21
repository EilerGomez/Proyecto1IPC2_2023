
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
@WebServlet(name = "ServletTablaUsuarios", urlPatterns = {"/ServletTablaUsuarios"})
public class ServletTablaUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResultSet resultado = Conexion.traerUsuarios();
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            if (request.getParameter("buscar") != null) {
                resultado = Conexion.traerUsuarios();
            }
            while (resultado.next()) {
                String estado = "inactivo";
                if (Conexion.rs.getString("activo").equals("1")) {
                    estado = "activo";
                }
                String area = null;
                int numArea = Integer.parseInt(Conexion.rs.getString("area"));
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
                out.print("<tr>\n"
                        + "                                    <th scope=\"col\">" + Conexion.rs.getString("codigo_usuario") + "</th>\n"
                        + "                                    <th scope=\"col\">" + Conexion.rs.getString("nombre") + "</th>\n"
                        + "                                    <th scope=\"col\">" + Conexion.rs.getString("nombre_usuario") + "</th>\n"
                        + "                                    <th scope=\"col\">" + Conexion.rs.getString("correo") + "</th>\n"
                        + "                                    <th scope=\"col\">" + area + "</th>\n"
                        + "                                    <th scope=\"col\">" + estado + "</th>\n"
                        + "                                    <td>"
                        + "                                         <a href=\"DelAdministrador/EditarUsuario.jsp?codigo=" + resultado.getString(1) + "&nombre=" + resultado.getString(2) + "&nombreUsuario=" + resultado.getString(3) + "&correo=" + resultado.getString(4) +  "&area=" + resultado.getString(6) + "&activo=" + resultado.getString(7) +"\">"
                        + "                                             <img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAACXBIWXMAAAsTAAALEwEAmpwYAAABcUlEQVR4nL3Vv0sXcRzH8QcNTekX2iK1aIiWoE0HpybbxErUQCh0ynBpqMbcGvoDXNSxiOgfaAvSwP/AapEicmho8Wt5cfAWjsvz+/3cXb3gBXcfuPfz3vf+cbSny9jAS4z7R7qKPWThA9xqG3IaQ9gpgFqHzeAjLlXAfmGuKeQMdiPgZ1zEcIDLmdWu2XV0cAVfS7CRY2Av6kAmsY/NHrBPBdBqKmQK3UKAk2AX4vp73PetmyVIFn6PwQpY7mspkNtR1KzC7yoy67QJycLbOBsbIu/GhymQ2T4hWalmAymQOzFwWaLnUyc+JZMs/OR/QB6nQO7idw3Io9TuSoUcYlmi3hYe7hfyIBXSian/iRt4hjV8OQFyXw1NR4A3pfPXFZAlNbURQRYrzhtnkusUvkWQ8/5epEeQvFEWNNBY4U84gXO4h1f4UcgkP2ukp4W3Pih1XTe6MV9HjbVVqkP+GddjrpLWfC89xwesYDRq1rr+ADU56RJDk6BOAAAAAElFTkSuQmCC\">"
                        + "\n"
                        + "                                     </td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServletTablaUsuarios.class.getName()).log(Level.SEVERE, null, ex);
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
