package Servelets;

import Encriptacion.Encriptacion;
import SQL.Conexion;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.lang.Object;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.github.cliftonlabs.json_simple.JsonArray;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@MultipartConfig
@WebServlet(name = "cargadatosServlet", urlPatterns = {"/cargadatosServlet"})
public class cargadatosServlet extends HttpServlet {

    Encriptacion encriptar = new Encriptacion();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        //out.print("Hola mundo");

        Part filePart = request.getPart("file");
        InputStream fileStream = filePart.getInputStream();
        Object obj = null;
        try (BufferedReader in = new BufferedReader(new InputStreamReader(fileStream))) {
            JSONParser jparser = new JSONParser();
            try {
                obj = jparser.parse(in);
            } catch (ParseException ex) {
                Logger.getLogger(cargadatosServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            JSONObject producto = (JSONObject) obj;
            
            List<JSONObject> listaProducto = (List<JSONObject>) producto.get("productos");
            guardarProductosBodega(listaProducto);
            List<JSONObject> listaTiendas = (List<JSONObject>) producto.get("tiendas");
            guardarTiendas(listaTiendas);
            List<JSONObject> listaAdmins = (List<JSONObject>) producto.get("admins");
            guardarAdministradores(listaAdmins);
            List<JSONObject> listaUsuariosTienda = (List<JSONObject>) producto.get("usuariostienda");
            guardarUsuariosTienda(listaUsuariosTienda);
            List<JSONObject> listaUsuariosSupervisores = (List<JSONObject>) producto.get("supervisores");
            guardarUsuariosSupervisores(listaUsuariosSupervisores);
            List<JSONObject> listaUsuariosBodega = (List<JSONObject>) producto.get("encargadosBodega");
            guardarUsuariosDeBodega(listaUsuariosBodega);
            List<JSONObject> listaPedidos = (List<JSONObject>) producto.get("pedidos");
            guardarPedidos(listaPedidos);
            List<JSONObject> listaEnvios = (List<JSONObject>) producto.get("envios");
            guardarEnvios(listaEnvios);
            List<JSONObject> listaIncidencias = (List<JSONObject>) producto.get("incidencias");
            guardarIncidencias(listaIncidencias);
            List<JSONObject> listaDevoluciones = (List<JSONObject>) producto.get("devoluciones");
            guardarDevolucion(listaDevoluciones);
        }
        Conexion.actualizarArchivosEntrada();
        try {
            Conexion.con.close();
        } catch (SQLException ex) {
            Logger.getLogger(cargadatosServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("index.jsp");

    }

    private void leerProductos(Object productos) {
        JSONObject producto = (JSONObject) productos;
        List<JSONObject> listaProducto = (List<JSONObject>) producto.get("productos");
        for (JSONObject productoU : listaProducto) {
            long codigo = (Long) productoU.get("codigo");
            System.out.println(codigo);

            String age = (String) productoU.get("nombre");
            System.out.println(age);

            long costo = (long) productoU.get("costo");
            System.out.println(costo);

            long precio = (long) productoU.get("precio");
            System.out.println(precio);

            long existencias = (Long) productoU.get("existencias");
            System.out.println(existencias);
        }
    }

    private void guardarProductosBodega(List<JSONObject> listaProductos) {
        for (JSONObject atributos : listaProductos) {
            int id;
            double costo;
            double precio;
            String nombre;
            long codigo = (Long) atributos.get("codigo");
            id = (int) codigo;
            System.out.println(id);

            nombre = (String) atributos.get("nombre");
            System.out.println(nombre);

            try {
                costo = (double) atributos.get("costo");
            } catch (Exception e) {
                long cost = (Long) atributos.get("costo");
                costo = (double) cost;
            }
            System.out.println(costo);

            try {
                precio = (double) atributos.get("precio");
            } catch (Exception e) {
                long prec = (long) atributos.get("precio");
                precio = prec;
            }
            System.out.println(precio);

            long exist = (Long) atributos.get("existencias");
            int existencia = (int) exist;
            System.out.println(existencia + "\n");

            //long existencias = (Long) atributos.get("existencias");
            //System.out.println(existencias);
            //System.out.println(codigo + " \n " + age + "\n" + costo + "\n" + existencias + "\n" + precio);
            //Conexion.guardarCatalogos(id, nombreProducto, costo, existencias, precio);
            Conexion.guardarCatalogos(id, nombre, costo, existencia, precio);
            Conexion.guardarCatalogosDañados(id, 0);
        }
    }

    private void guardarTiendas(List<JSONObject> listaTiendas) {
        for (JSONObject atributos : listaTiendas) {
            int codigo_tienda;
            String direccion;
            String tipo;
            long codigo = (Long) atributos.get("codigo");
            codigo_tienda = (int) codigo;
            direccion = (String) atributos.get("direccion");
            tipo = (String) atributos.get("tipo");
            System.out.println(codigo_tienda + "\n" + direccion + "\n" + tipo);
            Conexion.guardarTienda(codigo_tienda, direccion, tipo);

            guardarCatalogosTiendas(atributos, codigo_tienda);
        }
    }

    private void guardarCatalogosTiendas(JSONObject atributoProducto, int codigoTienda) {
        List<JSONObject> catalogoTienda = (List<JSONObject>) atributoProducto.get("productos");
        for (JSONObject producto : catalogoTienda) {
            int codigo;
            int existencias;
            long cod = (Long) producto.get("codigo");
            long exist = (Long) producto.get("existencias");
            codigo = (int) cod;
            existencias = (int) exist;
            System.out.println("producto\n" + codigoTienda + "\n" + codigo + "\n" + existencias);
            Conexion.guardarCatalogoEnTienda(codigoTienda, codigo, existencias);

        }
    }

    private void guardarAdministradores(List<JSONObject> listaAdmins) {
        for (JSONObject atributos : listaAdmins) {

            int codigoUsuario;
            String nombre;
            String userName;
            String correo = null;
            String password;
            int area = 1;
            int activo = 1;
            //
            long cod = (long) atributos.get("codigo");
            nombre = (String) atributos.get("nombre");
            userName = (String) atributos.get("username");
            password = (String) atributos.get("password");
            codigoUsuario = (int) cod;
            System.out.println(codigoUsuario + "\n" + nombre + "\n" + userName + "\n" + password + "\n" + area + "\n" + activo);
            Conexion.guardarUsuario(codigoUsuario, nombre, userName, correo, encriptar.getMD5(password), area, activo);
        }
    }

    private void guardarUsuariosTienda(List<JSONObject> listaUsuariosTienda) {
        for (JSONObject atributos : listaUsuariosTienda) {
            int codigo;
            int codigoTienda;

            String nombre;
            String userName;
            String password;
            String correo;
            int area = 3;
            int activo = 1;

            long cod = (long) atributos.get("codigo");
            long codTienda = (long) atributos.get("tienda");

            codigo = (int) cod;
            codigoTienda = (int) codTienda;
            nombre = (String) atributos.get("nombre");
            userName = (String) atributos.get("username");
            password = (String) atributos.get("password");
            correo = (String) atributos.get("email");

            System.out.println(codigo + "\n" + codigoTienda + "\n" + nombre + "\n" + userName + "\n" + password + "\n" + correo + "\n" + area + "\n" + activo);

            Conexion.guardarUsuario(codigo, nombre, userName, correo, encriptar.getMD5(password), area, activo);
            Conexion.guardarUsuarioTienda(codigo, codigoTienda);
        }
    }

    private void guardarUsuariosSupervisores(List<JSONObject> listaUsuariosSupervisores) {
        for (JSONObject atributos : listaUsuariosSupervisores) {
            int codigo;
            String nombre;
            String userName;
            String password;
            String correo;
            int area = 4;
            int activo = 1;
            long cod = (long) atributos.get("codigo");

            codigo = (int) cod;
            nombre = (String) atributos.get("nombre");
            userName = (String) atributos.get("username");
            password = (String) atributos.get("password");
            correo = (String) atributos.get("email");
            System.out.println(codigo + "\n" + nombre + "\n" + userName + "\n" + password + "\n" + correo + "\n" + area + "\n" + activo);
            Conexion.guardarUsuario(codigo, nombre, userName, correo, encriptar.getMD5(password), area, activo);
        }
    }

    private void guardarUsuariosDeBodega(List<JSONObject> listaUsuariosBodega) {
        for (JSONObject atributos : listaUsuariosBodega) {
            int codigo;
            String nombre;
            String userName;
            String password;
            String correo;
            int area = 2;
            int activo = 1;
            long cod = (long) atributos.get("codigo");

            codigo = (int) cod;
            nombre = (String) atributos.get("nombre");
            userName = (String) atributos.get("username");
            password = (String) atributos.get("password");
            correo = (String) atributos.get("email");

            Conexion.guardarUsuario(codigo, nombre, userName, correo, encriptar.getMD5(password), area, activo);
            System.out.println(codigo + "\n" + nombre + "\n" + userName + "\n" + password + "\n" + correo + "\n" + area + "\n" + activo);
            String lista = (String) (atributos.get("tiendas").toString());
            JSONArray listaTienda = (JSONArray) atributos.get("tiendas");
            //System.out.println("tiendas: "+listaTienda.get(1));
            guardarTiendasUsuarioBodega(codigo, listaTienda);

        }

    }

    private void guardarTiendasUsuarioBodega(int codigoUsuario, JSONArray listaTienda) {
        System.out.println("\nTiendas:");
        for (int i = 0; i < listaTienda.size(); i++) {
            int idTienda = Integer.parseInt(listaTienda.get(i).toString());
            System.out.println(idTienda);
            Conexion.guardarTiendadeBodega(codigoUsuario, idTienda);
        }
    }

    private void guardarPedidos(List<JSONObject> listaPedidos) {
        for (JSONObject atributos : listaPedidos) {
            int idPedido;
            int codigoUsuario;
            int codigoTienda;
            String fecha;
            String estado;
            double costoTotalPedido;

            long id = (Long) atributos.get("id");
            long codUser = (Long) atributos.get("usuario");
            long codTienda = (Long) atributos.get("tienda");
            idPedido = (int) id;
            codigoUsuario = (int) codUser;
            codigoTienda = (int) codTienda;
            fecha = (String) atributos.get("fecha");
            estado = (String) atributos.get("estado");

            try {
                costoTotalPedido = (double) atributos.get("total");
            } catch (Exception e) {
                long tl = (long) atributos.get("total");
                costoTotalPedido = (double) tl;
            }

            System.out.println(idPedido + "\n" + codigoUsuario + "\n" + codigoTienda + "\n" + fecha + "\n" + estado + "\n" + costoTotalPedido);
            Conexion.guardarPedido(idPedido, codigoUsuario, codigoTienda, fecha, estado, costoTotalPedido,"Por defecto o por revisar");
            guardarListaProductoDelPedido(atributos, idPedido);
        }
    }

    private void guardarListaProductoDelPedido(JSONObject productos, int idPedido) {
        List<JSONObject> listaProductos = (List<JSONObject>) productos.get("productos");
        for (JSONObject atributos : listaProductos) {
            int idProducto;
            double costoUnitario;
            int cantidad;
            double subtotal;

            long id = (Long) atributos.get("codigo");
            long cant = (Long) atributos.get("cantidad");

            idProducto = (int) id;
            cantidad = (int) cant;
            try {
                costoUnitario = (double) atributos.get("costoU");
            } catch (Exception e) {
                long cu = (Long) atributos.get("costoU");
                costoUnitario = (double) cu;
            }
            try {
                subtotal = (double) atributos.get("costoTotal");
            } catch (Exception e) {
                long ct = (Long) atributos.get("costoTotal");
                subtotal = (double) ct;
            }
            System.out.println("productos:\n");
            System.out.println(idProducto + "\n" + costoUnitario + "\n" + cantidad + "\n" + subtotal);
            Conexion.guardarProductosPedido(idPedido, idProducto, costoUnitario, cantidad, subtotal);
        }

    }

    private void guardarEnvios(List<JSONObject> listaEnvios) {
        for (JSONObject atributos : listaEnvios) {
            int idEnvio;
            int idPedido;
            int codigoUsuario;
            int codigoTienda;
            String fechaSalida = "0";
            String fechaRecibido = "";
            String estado;
            double costoTotalEnvio;

            long id = (Long) atributos.get("id");
            long pedido = (Long) atributos.get("pedido");
            long codUser = (Long) atributos.get("usuario");
            long codTienda = (Long) atributos.get("tienda");
            idEnvio = (int) id;
            idPedido = (int) pedido;
            codigoUsuario = (int) codUser;
            codigoTienda = (int) codTienda;
            fechaSalida = (String) atributos.get("fechaSalida");
            fechaRecibido = (String) atributos.get("fechaRecibido");
            estado = (String) atributos.get("estado");

            try {
                costoTotalEnvio = (double) atributos.get("total");
            } catch (Exception e) {
                long tl = (long) atributos.get("total");
                costoTotalEnvio = (double) tl;
            }

            System.out.println(idEnvio + "\n" + codigoUsuario + "\n" + codigoTienda + "\n" + fechaSalida + "\n" + fechaRecibido + "\n" + estado + "\n" + costoTotalEnvio);
            Conexion.guardarEnvio(idEnvio, codigoUsuario, codigoTienda, fechaSalida, fechaRecibido, costoTotalEnvio, estado, idPedido);
            guardarListaProductoDelEnvio(atributos, idEnvio);
        }
    }

    private void guardarListaProductoDelEnvio(JSONObject productos, int idEnvio) {
        System.out.println("productos:\n");
        List<JSONObject> listaProductos = (List<JSONObject>) productos.get("productos");
        for (JSONObject atributos : listaProductos) {
            int idProducto;
            double costoUnitario;
            int cantidad;
            double subtotal;

            long id = (Long) atributos.get("codigo");
            long cant = (Long) atributos.get("cantidad");

            idProducto = (int) id;
            cantidad = (int) cant;
            try {
                costoUnitario = (double) atributos.get("costoU");
            } catch (Exception e) {
                long cu = (Long) atributos.get("costoU");
                costoUnitario = (double) cu;
            }
            try {
                subtotal = (double) atributos.get("costoTotal");
            } catch (Exception e) {
                long ct = (Long) atributos.get("costoTotal");
                subtotal = (double) ct;
            }
            System.out.println(idProducto + "\n" + costoUnitario + "\n" + cantidad + "\n" + subtotal);
            Conexion.guardarProductosEnvio(idEnvio, idProducto, costoUnitario, cantidad, subtotal);
        }
    }
    
    private void guardarIncidencias(List<JSONObject> listaIncidencia){
        for (JSONObject atributos : listaIncidencia) {
            int idIncidencia;
            int idEnvio;
            int codigoUsuario;
            int codigoTienda;
            String fecha;
            String estado;
            String solucion="";

            long id = (Long) atributos.get("id");
            long envio = (Long) atributos.get("envio");
            long codUser = (Long) atributos.get("usuario");
            long codTienda = (Long) atributos.get("tienda");
            idIncidencia = (int) id;
            idEnvio = (int)envio;
            codigoUsuario = (int) codUser;
            codigoTienda = (int) codTienda;
            fecha = (String) atributos.get("fecha");
            estado = (String) atributos.get("estado");
            solucion =(String) atributos.get("solucion");
            

            System.out.println(idIncidencia + "\n" + codigoUsuario + "\n" + codigoTienda + "\n" + fecha + "\n" + solucion + "\n" + estado);
            Conexion.guardarIncidencia(idIncidencia, codigoUsuario, codigoTienda, fecha, estado, solucion, idEnvio);
            guardarProductosdeIncidencia(atributos,idIncidencia);
            //guardarListaProductoDelEnvio(atributos, idEnvio);
            //guardarla en La db, y guardar los productos que contenga
        }
    }
    
    private void guardarProductosdeIncidencia(JSONObject productos, int idIncidencia){
        System.out.println("productos:\n");
        List<JSONObject> listaProductos = (List<JSONObject>) productos.get("productos");
        for (JSONObject atributos : listaProductos) {
            int idProducto;
            int cantidad;
            String motivo;
            long id = (Long) atributos.get("codigo");
            long cant = (Long) atributos.get("cantidad");
            motivo = (String) atributos.get("motivo");
            idProducto = (int) id;
            cantidad = (int) cant;
            
            System.out.println(idProducto + "\n" + cantidad + "\n" + motivo);
            Conexion.guardarListaProductosIncidencia(idIncidencia, idProducto, cantidad, motivo);
        }
    }
    
    // faltan devoluciones
    private void guardarDevolucion(List<JSONObject> listaDevoluciones){
        for (JSONObject atributos : listaDevoluciones) {
            int idDevolucion;
            int idEnvio;
            int codigoUsuario;
            int codigoTienda;
            String fecha;
            String estado;
            double total;

            long id = (Long) atributos.get("id");
            long envio = (long) atributos.get("envio");
            long codUser = (Long) atributos.get("usuario");
            long codTienda = (Long) atributos.get("tienda");
            idDevolucion = (int) id;
            idEnvio = (int) envio;
            codigoUsuario = (int) codUser;
            codigoTienda = (int) codTienda;
            fecha = (String) atributos.get("fecha");
            estado = (String) atributos.get("estado");
            try {
                total = (double) atributos.get("total");
            } catch (Exception e) {
                long ct = (Long) atributos.get("total");
                total = (double) ct;
            }

            System.out.println(idDevolucion + "\n" + codigoUsuario + "\n" + codigoTienda + "\n" + fecha + "\n" + estado+ "\n" +total);
            Conexion.guardarDevolucion(idDevolucion, codigoUsuario, codigoTienda, fecha, estado, total, idEnvio);
            guardarProductosDevolucion(atributos,idDevolucion);
        }
    }
    
    private void guardarProductosDevolucion( JSONObject productos, int idDevolucion ){
         System.out.println("productos:\n");
        List<JSONObject> listaProductos = (List<JSONObject>) productos.get("productos");
        for (JSONObject atributos : listaProductos) {
            int idProducto;
            double costoUnitario;
            int cantidad;
            double costoTotal;
            String motivo;
            long id = (Long) atributos.get("codigo");
            long cant = (Long) atributos.get("cantidad");
            motivo = (String) atributos.get("motivo");
            idProducto = (int) id;
            cantidad = (int) cant;
            try {
                costoUnitario = (double) atributos.get("costo");
            } catch (Exception e) {
                long ct = (Long) atributos.get("costo");
                costoUnitario = (double) ct;
            }
            try {
                costoTotal = (double) atributos.get("costoTotal");
            } catch (Exception e) {
                long ct = (Long) atributos.get("costoTotal");
                costoTotal = (double) ct;
            }
            
            System.out.println(idProducto + "\n" +costoUnitario+ "\n" + cantidad + "\n" +costoTotal+ "\n" + motivo);
           Conexion.guardarListaProductosDevolucion(idDevolucion, idProducto, costoUnitario, cantidad, costoTotal, motivo);
        }
    }

}
