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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
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
@WebServlet(name = "servletNuevaDevolucion", urlPatterns = {"/servletNuevaDevolucion"})
public class servletNuevaDevolucion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    public String FechaFull() {
        Calendar calendario = new GregorianCalendar();
        return String.valueOf(calendario.get(Calendar.YEAR)
                + "-" + String.valueOf(calendario.get(Calendar.MONTH) + 1)
                + "-" + String.valueOf(calendario.get(Calendar.DAY_OF_MONTH)));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         PrintWriter outt = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        //
        long diffrence = 0;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
            java.util.Date firstDate = sdf.parse(request.getParameter("fechaRecibida"));
            java.util.Date secondDate = sdf.parse(FechaFull());

            long diff = secondDate.getTime() - firstDate.getTime();

            TimeUnit time = TimeUnit.DAYS;
            diffrence = time.convert(diff, TimeUnit.MILLISECONDS);
            System.out.println("The difference in days is : " + diffrence);
        } catch (ParseException ex) {
            Logger.getLogger(servletNuevaDevolucion.class.getName()).log(Level.SEVERE, null, ex);
        }
///

        if (diffrence<=7) {
            try (PrintWriter out = response.getWriter()) {
                HttpSession sesion = request.getSession();
                int idEnvio = Integer.parseInt(request.getParameter("idEnvio"));
                int usuario = Integer.parseInt(sesion.getAttribute("id").toString());
                int tienda = Integer.parseInt(sesion.getAttribute("tienda").toString());
                if (request.getParameter("idDevolucion").equals("0")) {

                    Conexion.crearDevolucion(usuario, tienda, FechaFull(), "ACTIVA", 0, idEnvio);
                    Conexion.traerUltimaDevolucionPorUsuario(Integer.parseInt(sesion.getAttribute("id").toString()));
                    while (Conexion.rs.next()) {
                        out.print((Conexion.rs.getString(1)));
                        request.getSession().setAttribute("idDevolucion", (Conexion.rs.getString(1)));
                    }
                    request.getSession().setAttribute("idEnvio", idEnvio);
                    response.sendRedirect("DelTienda/nuevaDevolucion.jsp");
                }

            } catch (SQLException ex) {
                Logger.getLogger(servletNuevaDevolucion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else{
            outt.print("El envio se hizo hace mas de una semana, por lo tanto no se puede realizar la devolucion");
        }
    }

}
