/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package SQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class Conexion {

    public static Connection con;
    public static Statement st;
    public static ResultSet rs;
    public static int linea=0;

    /**
     *
     */
    public static List<String> errores;
    

    public static void conectar() {
        String driver = "com.mysql.cj.jdbc.Driver";
        String user = "proyecto1IPC2_2023";
        String password = "eiler123";
        String url = "jdbc:mysql://localhost:3306/tienda_productos";
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            System.out.println("Conexion establecida");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error de conexion" + e);
        }
    }
    
    public static void traerVerificacionDeArchivos(){
        try {
            PreparedStatement stm = con.prepareStatement("SELECT * FROM  carga_archivos WHERE numero =1;");
           
            rs = stm.executeQuery();
            //stm.close();

        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void actualizarArchivosEntrada(){
        String query = "update carga_archivos set cargado =1 where numero =1;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);           
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
        }
    }

    public static void verificarUsuario(int usuario, String password, int area) {
        try {
            PreparedStatement stm = con.prepareStatement("select * from usuarios where codigo_usuario=? and contrasenia=? and area=?;");
            stm.setInt(1, usuario);
            stm.setString(2, password);
            stm.setInt(3, area);
            rs = stm.executeQuery();
            System.out.println(usuario + ", " + password + ", " + area);
            //stm.close();

        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void guardarCatalogos(int id, String nombreProducto, double costo, int existencias, double precio) {
  
        String query = "INSERT INTO producto_bodega (codigo_producto, nombre_producto, costo,existencias,precio) VALUES (?, ?, ?,?,?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.setString(2, nombreProducto);
            stmt.setDouble(3, costo);
            stmt.setInt(4, existencias);
            stmt.setDouble(5, precio);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al crear catalogo: " + e);
            errores.add( "NO SE HA PODIDO GUARDAR(EN CATALOGOS DE LA BODEGA) EL PRODUCTO : " + id + ", NOMBRE: " + nombreProducto + ", COSTO: " + costo + ", EXSTENCIAS: " + existencias + ", PRECIO: " + precio + "; PUEDA SER QUE YA SE HAYA GUARDADO UN PRODUCTO CON EL MISMO ID");
        }
    }

    public static void guardarCatalogosDañados(int id, int existencias) {
        String query = "INSERT INTO producto_daniado VALUES (?, ?);";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.setInt(2, existencias);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar catalogo dañado: " + e);
        }
    }

    public static void verificarExistenciaCatalogo(int codigo) {
        try {
            PreparedStatement stm = con.prepareStatement("select * from producto_bodega where codigo_producto=?;");
            stm.setInt(1, codigo);
            rs = stm.executeQuery();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void guardarCatalogoEnTienda(int codigoTienda, int codigoProducto, int existencias) {
        String query = "INSERT INTO productos_tienda VALUES (?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, codigoTienda);
            stmt.setInt(2, codigoProducto);
            stmt.setInt(3, existencias);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al crear el catalogo en la tienda: " + e);
            errores.add("NO SE HA PODIDO GUARDAR EN EL CATÁLOGO DE LA TIENDA: " + codigoTienda + "; EL PRODUCTO: " + codigoProducto + ", EXISTENCIA: " + existencias + "; PUEDE SER QUE EL PRODUCTO NO ESTE EN EL CATALGO DE BODEGAS O QUE EL PRODUCTO YA SE HAYA GUARDADO EN LA TIENDA");
        }
    }

    public static void guardarTienda(int codigoTienda, String direccion, String tipo) {
        String query = "INSERT INTO tienda VALUES (?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, codigoTienda);
            stmt.setString(2, direccion);
            stmt.setString(3, tipo);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al crear usuario: " + e);
            errores.add("NO SE HA PODIDO GUARDAR LA TIENDA: " + codigoTienda + ", DIRECCION: " + direccion + ", TIPO: " + tipo);
        }
    }

    public static void guardarUsuario(int codigo, String nombre, String userName, String correo, String password, int area, int activo) {
        String query = "INSERT INTO usuarios VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, codigo);
            stmt.setString(2, nombre);
            stmt.setString(3, userName);
            stmt.setString(4, correo);
            stmt.setString(5, password);
            stmt.setInt(6, area);
            stmt.setInt(7, activo);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al crear usuario: " + e);
            String areaUser = "";
            if (area == 1) {
                areaUser = "ADMINISTRADOR";
            } else if (area == 2) {
                areaUser = "BODEGUERO";
            } else if (area == 3) {
                areaUser = "DE TIENDA";
            } else if (area == 4) {
                areaUser = "SUPERVISOR";
            }
            errores.add("NO SE HA PODIDO GUARDAR EL USUARIO: " + codigo + ", NOMBRE: " + nombre + ", USERNAME: " + userName + ", CORREO: " + correo + ", PASSWORD: " + password + ", AREA: " + areaUser + "; PUEDA SER A CAUSA DE QUE UN USUARIO CON EL MISMO ID YA SE HAYA GUARDADO ANTERIORMENTE");
        }
    }

    public static void guardarUsuarioTienda(int codigo, int codigoTienda) {
        String query = "INSERT INTO usuario_tienda VALUES (?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, codigo);
            stmt.setInt(2, codigoTienda);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al crear usuarioTienda: " + e);
            errores.add("NO SE HA PODIDO ASIGNAR LA TIENDA: " + codigoTienda + " AL USUARIO DE TIENDA: " + codigo + "; PUEDE SER A CAUSA DE QUE LA TIENDA YA TIENE UN USUARIO DE TIENDA");
        }
    }

    public static void guardarTiendadeBodega(int codigo, int codigoTienda) {
        String query = "INSERT INTO tiendas_usuario_bodega VALUES (?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, codigo);
            stmt.setInt(2, codigoTienda);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardarTienda en bodega: " + e);
            errores.add("NO SE HA PODIDO ASIGNAR LA TIENDA: " + codigoTienda + " AL USUARIO DE BOEGAS: " + codigo + "; PUEDE SER A CAUSA DE QUE LA TIENDA YA TIENE ASIGNADO UN USAURIO DE BODEGA");
        }
    }

    public static void guardarPedido(int idPedido, int codigoUsuario, int codigoTienda, String fecha, String estado, double costoTotalPedido, String mensaje) {
        String query = "INSERT INTO pedidos VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, idPedido);
            stmt.setInt(2, codigoUsuario);
            stmt.setInt(3, codigoTienda);
            stmt.setString(4, fecha);
            stmt.setString(5, estado);
            stmt.setDouble(6, costoTotalPedido);
            stmt.setString(7, mensaje);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar pedido: " + e);
            errores.add("NO SE HA PODIDO GUARDAR EL PEDIDO: " + idPedido + ", USUARIO(TIENDA): " + codigoUsuario + ", TIENDA: " + codigoTienda + ", FECHA: " + fecha + ", ESTADO: " + estado + ", COSTO TOTAL: " + costoTotalPedido + "; PUEDE SER A CAUSA DE QUE UN PEDIDO CON EL MISMO ID YA SE HAYA GUARDADO ANTERIORMENTE");
        }
    }

    public static void guardarProductosPedido(int idPedido, int idProducto, double costoUnitario, int cantidad, double subtotal) {
        String query = "INSERT INTO listado_productos_pedidos VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, idPedido);
            stmt.setInt(2, idProducto);
            stmt.setDouble(3, costoUnitario);
            stmt.setInt(4, cantidad);
            stmt.setDouble(5, subtotal);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar listado de productos pedidos: " + e);
            errores.add("NO SE HA PODIDO AGREGAR EN EL PEDIDO: " + idPedido + "; EL PRODUCTO: " + idProducto + ", COSTO UNITARIO: " + costoUnitario + ", CANTIDAD: " + cantidad + ", SUBTOTAL: " + subtotal + "; PUEDA SER QUE UN PRODUCTO CON EL MISMO ID SE HAYA GUARDADO EN EL PEDIDO ANTERIORMENTE");
        }
    }

    public static void guardarEnvio(int idEnvio, int codigoUsuario, int codigoTienda, String fechaSalida, String fechaRecibida, double costoTotal, String estado, int idPedido) {
        String query = "INSERT INTO envios VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, idEnvio);
            stmt.setInt(2, codigoUsuario);
            stmt.setInt(3, codigoTienda);
            stmt.setString(4, fechaSalida);
            if (fechaRecibida.equals("")) {
                stmt.setString(5, null);
            } else {
                stmt.setString(5, fechaRecibida);
            }
            stmt.setDouble(6, costoTotal);
            stmt.setString(7, estado);
            stmt.setInt(8, idPedido);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar envio: " + e);
            errores.add("NO SE HA GUADRADO EL ENVIO: " + idEnvio + ", USUARIO(BODEGA): " + codigoUsuario + ", TIENDA: " + codigoTienda + ", FECHA SALIDA: " + fechaSalida + ", FECHA RECIBIDA: " + fechaRecibida + ", TOTAL: " + costoTotal + ", ESTADO: " + estado + ", ID PEDIDO: " + idPedido + "; PUEDA SER QUE UN ENVIO CON EL MISMO ID YA SE HAYA GUARDADO ANTERIORMENTE O QUE NO EXISTA UN PEDIDO CON ID: " + idPedido);
        }
    }

    public static void guardarProductosEnvio(int idEnvio, int idProducto, double costoUnitario, int cantidad, double subtotal) {
        String query = "INSERT INTO listado_productos_envio VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, idEnvio);
            stmt.setInt(2, idProducto);
            stmt.setDouble(3, costoUnitario);
            stmt.setInt(4, cantidad);
            stmt.setDouble(5, subtotal);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar listado de productos envio: " + e);
            errores.add("NO SE HA PODIDO AGREGAR EN EL ENVIO: " + idEnvio + "; EL PRODUCTO: " + idProducto + ", COSTO UNITARIO: " + costoUnitario + ", CANTIDAD: " + cantidad + ", SUBTOTAL: " + subtotal + "; PUEDA SER QUE UN PRODUCTO CON EL MISMO ID SE HAYA GUARDADO EN EL ENVIO ANTERIORMENTE");

        }
    }

    public static void guardarIncidencia(int idIncidencia, int codigoUsuario, int codigoTienda, String fecha, String estado, String solucion, int idEnvio) {
        String query = "INSERT INTO incidencias VALUES (?, ?, ?, ?, ?, ?,?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, idIncidencia);
            stmt.setInt(2, codigoUsuario);
            stmt.setInt(3, codigoTienda);
            stmt.setString(4, fecha);
            stmt.setString(5, estado);
            stmt.setString(6, solucion);
            stmt.setInt(7, idEnvio);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar incidencia: " + e);
            errores.add("NO SE HA GUADRADO LA INCIDENCIA: " + idIncidencia + ", USUARIO(TIENDA): " + codigoUsuario + ", TIENDA: " + codigoTienda + ", FECHA: " + fecha + ", ESTADO: " + estado + ", SOLUCION: " + solucion + "; PUEDA SER QUE UNA INCIDENCIA CON EL MISMO ID YA SE HAYA GUARDADO ANTERIORMENTE");

        }

    }

    public static void guardarListaProductosIncidencia(int idIncidencia, int idProducto, int cantidad, String motivo) {
        String query = "INSERT INTO incidencia_productos VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, idIncidencia);
            stmt.setInt(2, idProducto);
            stmt.setInt(3, cantidad);
            stmt.setString(4, motivo);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar listado de productos incidencia: " + e);
            errores.add("NO SE HA PODIDO AGREGAR EN LA INCIDECNCIA: " + idIncidencia + "; EL PRODUCTO: " + idProducto + ", CANTIDAD: " + cantidad + ", MOTIVO: " + motivo + "; PUEDA SER QUE UN PRODUCTO CON EL MISMO ID SE HAYA GUARDADO EN LA INCIDENCIA ANTERIORMENTE");

        }
    }

    public static void guardarDevolucion(int idDevolucion, int codigoUsuario, int codigoTienda, String fechaDevolucion, String estado, double total, int idEnvio) {
        String query = "INSERT INTO devoluciones VALUES (?, ?, ?, ?, ?, ?,?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, idDevolucion);
            stmt.setInt(2, codigoUsuario);
            stmt.setInt(3, codigoTienda);
            stmt.setString(4, fechaDevolucion);
            stmt.setString(5, estado);
            stmt.setDouble(6, total);
            stmt.setInt(7, idEnvio);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar devolucion: " + e);
            errores.add("NO SE HA GUADRADO LA DEVOLUCION: " + idDevolucion + ", USUARIO(TIENDA): " + codigoUsuario + ", TIENDA: " + codigoTienda + ", FECHA: " + fechaDevolucion + ", ESTADO: " + estado + ", TOTAL: " + total + "; PUEDA SER QUE UNA DEVOLUCION CON EL MISMO ID YA SE HAYA GUARDADO ANTERIORMENTE");

        }
    }

    public static void guardarListaProductosDevolucion(int idDevolucion, int idProducto, double costoUnitario, int cantidadAfectada, double subtotal, String motivo) {
        String query = "INSERT INTO productos_devolucion VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, idDevolucion);
            stmt.setInt(2, idProducto);
            stmt.setDouble(3, costoUnitario);
            stmt.setInt(4, cantidadAfectada);
            stmt.setDouble(5, subtotal);
            stmt.setString(6, motivo);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar listado de productos devolucion: " + e);
            errores.add("NO SE HA PODIDO AGREGAR EN LA DEVOLUCION: " + idDevolucion + "; EL PRODUCTO: " + idProducto + ", COSTO UNITARIO: " + costoUnitario + ", CANTIDAD AFECTADA: " +cantidadAfectada+ ", SUBTOTAL" + subtotal  + ", MOTIVO: " + motivo + "; PUEDA SER QUE UN PRODUCTO CON EL MISMO ID SE HAYA GUARDADO EN LA DEVOLUCION ANTERIORMENTE");

        }
    }

    public static void guardarUsuarioNuevo(String nombre, String userName, String correo, String password, int area, int activo) {
        String query = "INSERT INTO usuarios(nombre,nombre_usuario,correo,contrasenia,area,activo) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, nombre);
            stmt.setString(2, userName);
            stmt.setString(3, correo);
            stmt.setString(4, password);
            stmt.setInt(5, area);
            stmt.setInt(6, activo);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al crear usuario: " + e);
        }
    }

    public static ResultSet traerUsuarios() {
        try {
            PreparedStatement stmt = con.prepareStatement("select * from usuarios order by codigo_usuario desc;");
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static void traerUsuarioPorCodigo(int codigo) {
        String query = "select * from usuarios where codigo_usuario =?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            System.out.println(codigo);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(3));
            //close();
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario: " + e);
        }
    }

    public static void traerUsuarioPorNombre(String nombre) {
        String query = "select * from usuarios where nombre_usuario =?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, nombre);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(3));
            //stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario: " + e);
        }
    }

    public static void actualizarUsuario(int codigo, String nombre, String userName, String correo, int area, int activo) {
        String query = "update usuarios set nombre=?, nombre_usuario=?, correo=?, area=?, activo=? where codigo_usuario=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, nombre);
            stmt.setString(2, userName);
            stmt.setString(3, correo);
            stmt.setInt(4, area);
            stmt.setInt(5, activo);
            stmt.setInt(6, codigo);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
        }
    }

    public static void cerrarConexion() {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void traer5TiendasConMasPedidos(String fechaDesde, String fechaHasta, String estado) {
        String query = "SELECT t.codigo_tienda, t.direccion, t.tipo from pedidos p join tienda t on(p.codigo_tienda = t.codigo_tienda) "
                + "where p.fecha>=? and p.fecha<=? and p.estado=? group by t.codigo_tienda having count(*)>=1 limit 5;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            stmt.setString(3, estado);
            rs = stmt.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario: " + e);
        }
    }

    public static void traer5UsuariosConMasPedidos(String fechaDesde, String fechaHasta) {
        String query = "SELECT u.codigo_usuario, u.nombre, u.nombre_usuario, u.correo, u.area from pedidos p join usuarios u on(p.codigo_usuario = u.codigo_usuario) "
                + "where p.fecha>=? and p.fecha<=? group by u.codigo_usuario having count(*)>1 limit 5;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            rs = stmt.executeQuery();
            System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario: " + e);
        }
    }

    public static void traer5UsuariosConMasEnvios(String fechaDesde, String fechaHasta) {
        String query = "SELECT u.codigo_usuario, u.nombre, u.nombre_usuario, u.correo, u.area from envios e join usuarios u on(e.codigo_usuario = u.codigo_usuario) "
                + "where e.fecha_salida>=? and e.fecha_salida<=? group by e.codigo_usuario having count(*)>1 limit 5;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario: " + e);
        }
    }

    public static void traerProductoMasPedidoPorTiendas(String fechaDesde, String fechaHasta) {
        String query = "select p.codigo_producto, p.nombre_producto, p.costo, p.existencias, p.precio, pd.fecha from producto_bodega p join listado_productos_pedidos l on(p.codigo_producto=l.id_producto) \n"
                + "join pedidos pd on(pd.id_pedido = l.id_pedido) where pd.fecha >=? and pd.fecha <=? group by p.codigo_producto having count(*)>1 limit 20;  ";

        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario: " + e);
        }
    }

    public static void traerProductoDañadoPorTiendas(String fechaDesde, String fechaHasta) {
        String query = "select p.codigo_producto, p.nombre_producto, pd.motivo_devolucion, t.codigo_tienda, t.direccion, p.costo from producto_bodega p join productos_devolucion pd on(p.codigo_producto=pd.codigo_producto)\n"
                + "		join devoluciones dv on(dv.id_devolucion = pd.id_devolucion) \n"
                + "        join tienda t on(t.codigo_tienda = dv.codigo_tienda) where dv.fecha_devolucion >= ? and dv.fecha_devolucion <=?; ";

        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario: " + e);
        }
    }

    public static ResultSet traerUsuarioBodega() {
        String query = "select * from usuarios where area =2;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario bodega: " + e);
        }
        return rs;
    }

    public static void traerTiendas() {
        String query = "select * from tienda;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las tiendas: " + e);
        }
    }

    public static void traerTiendasDeUnUsuario(int usuario) {
        String query = "select  td.codigo_tienda, t.direccion, t.tipo from tiendas_usuario_bodega td join tienda t "
                + "on(td.codigo_tienda=t.codigo_tienda) where codigo_usuario=? ;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario bodega: " + e);
        }
    }

    public static void traerUsuarioTienda() {
        String query = "select * from usuarios where area =3;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el usuario tienda: " + e);
        }
    }

    public static void traerUsuariosDeUnaTienda(int tienda) {
        String query = "select u.codigo_usuario, u.nombre, u.nombre_usuario,u.correo, u.area, u.activo from usuario_tienda ut join usuarios u "
                + "on(ut.codigo_usuario = u.codigo_usuario) where codigo_tienda=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar usuario bodega: " + e);
        }
    }

    public static void guardarPedidoRealizado(int codigoUsuario, int codigoTienda, String fecha, String estado, double costoTotalPedido) {
        String query = "INSERT INTO pedidos(codigo_usuario, codigo_tienda, fecha, estado, costo_total_pedido) VALUES (?, ?, ?, ?, ?);";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, codigoUsuario);
            stmt.setInt(2, codigoTienda);
            stmt.setString(3, fecha);
            stmt.setString(4, estado);
            stmt.setDouble(5, costoTotalPedido);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar pedido: " + e);
        }
    }

    public static void traerUsuarioTiendaPorId(int codigo_usuario) {
        String query = "select * from usuario_tienda where codigo_usuario =?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, codigo_usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el usuario tienda: " + e);
        }
    }

    public static void traerTiendaPorId(int codigoTienda) {
        String query = "select * from tienda where codigo_tienda =?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, codigoTienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar la tienda: " + e);
        }
    }

    /*public static void traerIdUltimoRegistroPedidos() {
    
    try {
    PreparedStatement stmt = con.prepareStatement("select Max(id_pedido) maxPedido from pedidos;");
    rs = stmt.executeQuery();
    System.out.println(rs.getString(1));
    } catch (SQLException e) {
    System.out.println("Error al consultar el ultimo pedido: " + e);
    }
    
    }*/
    public static ResultSet traerIdUltimoRegistroPedidos(int codigo_usuario) {
        try {
            PreparedStatement stmt = con.prepareStatement("select Max(id_pedido) maxPedido from pedidos where codigo_usuario=?;");
            stmt.setInt(1, codigo_usuario);
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public static void traerProductosDeTienda(int codigoTienda) {
        try {
            PreparedStatement stmt = con.prepareStatement("select  pb.codigo_producto, pb.nombre_producto, pb.costo, pt.existencias "
                    + "from productos_tienda pt join producto_bodega pb on(pb.codigo_producto = pt.codigo_producto) where pt.codigo_tienda=?;");
            stmt.setInt(1, codigoTienda);
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void traerProducto(int idProducto) {
        try {
            PreparedStatement stmt = con.prepareStatement("select * from producto_bodega where codigo_producto=?;");
            stmt.setInt(1, idProducto);
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void traerListaProductosPedido(int idPedido) {
        try {
            PreparedStatement stmt = con.prepareStatement("select pb.codigo_producto, pb.nombre_producto, lp.costo_unitario, "
                    + "lp.cantidad, lp.costo_subtotal from listado_productos_pedidos lp join producto_bodega pb on(lp.id_producto=pb.codigo_producto) where lp.id_pedido=?;");
            stmt.setInt(1, idPedido);
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void actualizarCostoTotalAlPedido(double costoTotal, int idPedido) {
        String query = "update pedidos set costo_total_pedido = ? where id_pedido = ?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setDouble(1, costoTotal);
            stmt.setInt(2, idPedido);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
        }
    }

    public static void traerPedidosPorCodigoUsuario(int codigoUsuario) {
        String query = "select * from pedidos where codigo_usuario = ? order by id_pedido desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, codigoUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar EL PEDIDO: " + e);
        }
    }

    public static void traerPedidosRechazados(int codigoUsuario) {
        String query = "select * from pedidos where codigo_usuario = ? and estado = 'RECHAZADO'order by id_pedido desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, codigoUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el pedido rechazado: " + e);
        }
    }

    public static void actualizarEstadoPedido(int idPedido, String estado) {
        String query = "update pedidos set estado = ? where id_pedido = ?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, estado);
            stmt.setInt(2, idPedido);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
        }
    }

    public static void actualizarCantidadProductoPedido(int idPedido, int idProducto, int nuevaCantidad, double costoU) {
        String query = "update listado_productos_pedidos set cantidad = ?, costo_subtotal=? where id_pedido = ? and id_producto=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, nuevaCantidad);
            stmt.setDouble(2, Math.round((costoU * nuevaCantidad) * 100.0) / 100.0);
            stmt.setInt(3, idPedido);
            stmt.setInt(4, idProducto);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
        }
    }

    public static void eliminarProductoDeListaPedidos(int idPedido, int idProducto) {
        try {
            PreparedStatement stm = con.prepareStatement("delete from listado_productos_pedidos where id_pedido = ? and id_producto=?;");
            stm.setInt(1, idPedido);
            stm.setInt(2, idProducto);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void traerEnviosPorCodigoTienda(int codigoTienda) {
        String query = "select * from envios where codigo_tienda=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, codigoTienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el envio: " + e);
        }
    }

    public static void traerListaProductosEnvio(int idEnvio) {
        try {
            PreparedStatement stmt = con.prepareStatement("select pb.codigo_producto, pb.nombre_producto, le.costo_unitario, "
                    + "le.cantidad, le.costo_subtotal from listado_productos_envio le join producto_bodega pb on(le.id_producto=pb.codigo_producto) where le.id_envio=?;");
            stmt.setInt(1, idEnvio);
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void traerEnviosDespachados(int codigoTienda) {
        String query = "select * from envios where codigo_tienda=? and (estado='DESPACHADO' or estado ='despachado');";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, codigoTienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el envio: " + e);
        }
    }

    public static void actualizarEstadoEnvio(int idEnvio, String estado, String fechaRecibido) {
        String query = "update envios set estado = ?, fecha_recibida = ? where id_envio = ?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, estado);
            stmt.setString(2, fechaRecibido);
            stmt.setInt(3, idEnvio);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
        }
    }

    public static void traerEnviosRecibidos(int codigoTienda) {
        String query = "select * from envios where codigo_tienda=? and (estado='RECIBIDO' or estado ='recibido');";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, codigoTienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el envio: " + e);
        }
    }

    public static void traerCatalogoDeTienda(int codigoTienda, int idProducto) {
        String query = "select * from productos_tienda where codigo_tienda =? and codigo_producto=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, codigoTienda);
            stmt.setInt(2, idProducto);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el productode Tienda: " + e);
        }
    }

    public static void actualizarCantidadCatalogoEnTienda(int tienda, int producto, int cantidadNueva) {
        String query = "update productos_tienda set existencias =? where codigo_tienda=? and codigo_producto=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cantidadNueva);
            stmt.setInt(2, tienda);
            stmt.setInt(3, producto);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
        }
    }

    public static void traerCatalogoPorIdTienda(int tienda) {
        String query = "select * from productos_tienda where codigo_tienda=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el productode Tienda: " + e);
        }
    }

    public static void traerProductosDeIncidencia(int incidencia) {
        String query = "select pb.codigo_producto, pb.nombre_producto, pi.cantidad_afectada, pi.motivo_incidencia from producto_bodega pb join incidencia_productos pi "
                + "on(pb.codigo_producto=pi.id_producto) where pi.id_incidencia=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, incidencia);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el productode incidencia: " + e);
        }
    }

    public static void traerUltimaIncidenciaPorUsuario(int idUsuario) {
        String query = "select Max(id_incidencia) maxPedido from incidencias where id_usuario=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar la ultima incidencia: " + e);
        }
    }

    public static void crearIncidencia(int usuario, int tienda, String fecha, String estado, int idEnvio) {
        String query = "insert into incidencias (id_usuario, id_tienda, fecha, estado, id_envio) values (?,?,?,?,?);";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, usuario);
            stmt.setInt(2, tienda);
            stmt.setString(3, fecha);
            stmt.setString(4, estado);
            stmt.setInt(5, idEnvio);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar incidencia: " + e);
        }
    }

    public static void traerListaProductosEnvioUsuario(int idEnvio, int idProducto) {
        try {
            PreparedStatement stmt = con.prepareStatement("select pb.codigo_producto, pb.nombre_producto, le.costo_unitario, "
                    + "le.cantidad, le.costo_subtotal from listado_productos_envio le join producto_bodega pb on(le.id_producto=pb.codigo_producto) where le.id_envio=? and le.id_producto=?;");
            stmt.setInt(1, idEnvio);
            stmt.setInt(2, idProducto);
            System.out.println(idEnvio + "-----" + idProducto);
            rs = stmt.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void traerIncidencias(int idUsuario) {
        String query = "select * from incidencias where id_usuario=? order by id_incidencia desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las incidencias: " + e);
        }
    }

    public static void crearDevolucion(int codigoUsuario, int codigoTienda, String fecha, String estado, double total, int idEnvio) {
        String query = "insert into devoluciones (codigo_usuario, codigo_tienda, fecha_devolucion, estado, total, id_envio) values (?,?,?,?,?,?);";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, codigoUsuario);
            stmt.setInt(2, codigoTienda);
            stmt.setString(3, fecha);
            stmt.setString(4, estado);
            stmt.setDouble(5, total);
            stmt.setInt(6, idEnvio);
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            System.out.println("Error al guardar incidencia: " + e);
        }
    }

    public static void traerUltimaDevolucionPorUsuario(int idUsuario) {
        String query = "select Max(id_devolucion) maxDev from devoluciones where codigo_usuario=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar la ultima incidencia: " + e);
        }
    }

    public static void traerProductosDeDevolucion(int devolucion) {
        String query = "select pb.codigo_producto, pb.nombre_producto, pd.cantidad_afectada, pb.costo, pd.motivo_devolucion, pd.costo_subtotal from producto_bodega pb join  productos_devolucion pd on(pb.codigo_producto=pd.codigo_producto) where pd.id_devolucion =?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, devolucion);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el productode incidencia: " + e);
        }
    }

    public static void actualizarTotalDevolucion(double total, int devolucion) {
        String query = "update devoluciones set total =? where id_devolucion=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setDouble(1, total);
            stmt.setInt(2, devolucion);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error al actualizar el costo de la devolucion: " + e);
        }
    }

    public static void traerDevoluciones(int idUsuario) {
        String query = "select * from devoluciones where codigo_usuario =? order by id_devolucion desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las devoluciones: " + e);
        }
    }
    //PARTES DEL REPORTE DEL USUARIO TIENDA:

    public static void traerProductosMenoresAExistencia(int existencia, int tienda) {
        String query = "select pt.codigo_producto, pb.nombre_producto, pb.costo, pt.existencias from productos_tienda pt join producto_bodega pb on(pt.codigo_producto=pb.codigo_producto) where pt.existencias<? and pt.codigo_tienda=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, existencia);
            stmt.setInt(2, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los productos: " + e);
        }
    }

    public static void traerPedidosPorIntervaloTiempoYestado(String fechaDesde, String fechaHasta, String estado, int usuario) {
        String query = "select * from pedidos where fecha >=? and fecha <=? and estado=? and codigo_usuario=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            stmt.setString(3, estado);
            stmt.setInt(4, usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos: " + e);
        }
    }

    public static void traerEnviosRecibidosEnIntervaloTiempo(String fechaDesde, String fechaHasta, int tienda) {
        String query = "select * from envios where (estado = 'RECIBIDO' or estado ='recibido') and fecha_recibida >=? and fecha_recibida <=? and codigo_tienda =?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            stmt.setInt(3, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los envios: " + e);
        }
    }

    public static void traerCantidadIncidenciasODevolucionesActivasDeEnvio(int idEnvio, boolean incidencia) {
        String query = "";
        if (incidencia == true) {
            query = "select count(i.id_incidencia) from envios e join incidencias i on(e.id_envio=i.id_envio) where i.estado = 'ACTIVA' and e.id_envio = ?;";

        } else {
            query = "select count(d.id_devolucion) from envios e join devoluciones d on(e.id_envio=d.id_envio) where d.estado = 'ACTIVA' and e.id_envio = ?;";
        }
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idEnvio);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las incidencias o devoluciones: " + e);
        }
    }

    public static void traerIncidenciasXTiempoYEstado(String fechaDesde, String fechaHasta, String estado, int usuario) {
        String query = "select * from incidencias where fecha >=? and fecha <=? and estado=? and id_usuario=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            stmt.setString(3, estado);
            stmt.setInt(4, usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las incidencias en x tiempo: " + e);
        }
    }

    public static void traerDevolucionesXTiempoYEstado(String fechaDesde, String fechaHasta, String estado, int usuario) {
        String query = "select * from devoluciones where fecha_devolucion >=? and fecha_devolucion <=? and estado=? and codigo_usuario=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, fechaDesde);
            stmt.setString(2, fechaHasta);
            stmt.setString(3, estado);
            stmt.setInt(4, usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las incidencias en x tiempo: " + e);
        }
    }

    public static void traerPedidosDeTiendasSupervisadas() {
        String query = "select p.id_pedido, p.codigo_usuario, p.codigo_tienda,t.tipo, p.fecha, p.estado, p.costo_total_pedido from pedidos p join tienda t on(t.codigo_tienda=p.codigo_tienda) where (t.tipo='supervisada' or t.tipo='SUPERVISADA');";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas supervisadas: " + e);
        }
    }

    public static void traerPedidosPendientes() {
        String query = "select p.id_pedido, p.codigo_usuario, p.codigo_tienda,t.tipo, p.fecha, p.estado, p.costo_total_pedido from pedidos p join tienda t on(t.codigo_tienda=p.codigo_tienda) where (t.tipo='supervisada' or t.tipo='SUPERVISADA') and (p.estado = 'PENDIENTE' or p.estado='pendiente');";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas supervisadas: " + e);
        }
    }

    public static void actualizarEstadoDelPedido(int idPedido, String mensaje, String estado) {
        String query = "update pedidos set estado =?, mensaje =? WHERE id_pedido = ?;";

        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, estado);
            stmt.setString(2, mensaje);
            stmt.setInt(3, idPedido);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error al actualizar estado y mensaje del pedido: " + idPedido + "; " + e);
        }
    }

    public static void traerPedidosPendientesPorTienda(int tienda) {
        String query = "select p.id_pedido, p.codigo_usuario, p.codigo_tienda,t.tipo, p.fecha, p.estado, p.costo_total_pedido from pedidos p join tienda t on(t.codigo_tienda=p.codigo_tienda) where (t.tipo='supervisada' or t.tipo='SUPERVISADA') and (p.estado = 'PENDIENTE' or p.estado='pendiente') and p.codigo_tienda=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas supervisadas de tienda: " + e);
        }
    }

    //REPORTES DEL USUARIO SUPERVISOR
    public static void traerPedidosDeTiendasSupervisadasIDTienda(int tienda) {
        String query = "select p.id_pedido, p.codigo_usuario, p.codigo_tienda,t.tipo, p.fecha, p.estado, p.costo_total_pedido from pedidos p join tienda t on(t.codigo_tienda=p.codigo_tienda) where (t.tipo='supervisada' or t.tipo='SUPERVISADA') and p.codigo_tienda=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas supervisadas de tienda: " + e);
        }
    }

    public static void traerPedidosDeTiendasSupervisadasEstado(String estado) {
        String query = "select p.id_pedido, p.codigo_usuario, p.codigo_tienda,t.tipo, p.fecha, p.estado, p.costo_total_pedido from pedidos p join tienda t on(t.codigo_tienda=p.codigo_tienda) where (t.tipo='supervisada' or t.tipo='SUPERVISADA') and p.estado=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, estado);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas supervisadas de tienda: " + e);
        }
    }

    public static void traerPedidosDeTiendasSupervisadasIntervaloTiempo(String desde, String hasta) {
        String query = "select p.id_pedido, p.codigo_usuario, p.codigo_tienda,t.tipo, p.fecha, p.estado, "
                + "p.costo_total_pedido from pedidos p join tienda t on(t.codigo_tienda=p.codigo_tienda) where (t.tipo='supervisada' or t.tipo='SUPERVISADA') and (p.fecha >=? and p.fecha<=?);";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, desde);
            stmt.setString(2, hasta);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas supervisadas de tienda: " + e);
        }
    }

    public static void traerPedidosTSupervisadasXFechaEstadoYCodigoTienda(String desde, String hasta, String estado, int tienda) {
        String query = "select p.id_pedido, p.codigo_usuario, p.codigo_tienda,t.tipo, p.fecha, p.estado, "
                + "p.costo_total_pedido from pedidos p join tienda t on(t.codigo_tienda=p.codigo_tienda) where "
                + "(t.tipo='supervisada' or t.tipo='SUPERVISADA') and (p.fecha >=? and p.fecha<=?) and p.estado = ? and p.codigo_tienda=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, desde);
            stmt.setString(2, hasta);
            stmt.setString(3, estado);
            stmt.setInt(4, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas supervisadas de tienda: " + e);
        }
    }

    //AQUI EMPIEZAN  METODOS PARA EL USUARIO DE BODEGAS
    public static void traerPedidosSolicitados(int idUsuario) {
        String query = "select p.id_pedido, p.codigo_usuario, p.codigo_tienda, t.direccion, p.fecha, p.estado, p.costo_total_pedido from pedidos p join tiendas_usuario_bodega tub on(p.codigo_tienda = tub.codigo_tienda) \n"
                + "join tienda t on(p.codigo_tienda = t.codigo_tienda) where tub.codigo_usuario = ? and p.estado='SOLICITADO';";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas a la bodega central: " + e);
        }
    }

    public static void crearNuevoEnvio(int usuario, int tienda, String fechaSalida, double costoTotal, int idPedido) {
        String query = "insert into envios (codigo_usuario, codigo_tienda, fecha_salida, costo_total_envio, estado, id_pedido) values (?,?,?,?,'DESPACHADO',?);";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, usuario);
            stmt.setInt(2, tienda);
            stmt.setString(3, fechaSalida);
            stmt.setDouble(4, costoTotal);
            stmt.setInt(5, idPedido);
            stmt.executeUpdate();
            stmt.close();
            System.out.println("envio creado");
        } catch (SQLException e) {
            System.out.println("Error al crear envio: " + e);
        }
    }

    public static void traerUltimoEnvioPorUsuario(int usuario) {
        String query = "select Max(id_envio) maxEnvio from envios where codigo_usuario=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el ultimo envio por el usuario: " + e);
        }
    }

    public static void traerCatalgosBodega() {
        String query = "select * from producto_bodega;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas a la bodega central: " + e);
        }
    }

    public static void traerCatalogoEspecifico(int producto) {
        String query = "select * from producto_bodega where codigo_producto=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, producto);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los pedidos de tiendas a la bodega central: " + e);
        }
    }

    public static void verificarProductoEnTienda(int tienda, int producto) {
        String query = "select * from productos_tienda where codigo_tienda =? and codigo_producto = ?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, tienda);
            stmt.setInt(2, producto);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el producto en el catalgo de la tienda " + e);
        }
    }

    public static void actualizarTotalEnvio(double total, int idEnvio) {
        String query = "update envios set costo_total_envio =? where id_envio=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setDouble(1, total);
            stmt.setInt(2, idEnvio);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error al actualizar el costo de la devolucion: " + e);
        }
    }

    public static void actualizarProductosEnBodega(int producto, int cantidadEnviada) {
        String query = "update producto_bodega set existencias = existencias -? where codigo_producto=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cantidadEnviada);
            stmt.setInt(2, producto);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error al actualizar las existencias en la bodega: " + e);
        }
    }

    public static void traerEnviosHechosPorUsuarioBodega(int usuario) {
        String query = "select p.id_envio, p.codigo_usuario, p.codigo_tienda, t.direccion, p.fecha_salida, p.fecha_recibida, p.estado, p.costo_total_envio from envios p join tiendas_usuario_bodega tub on(p.codigo_tienda = tub.codigo_tienda) \n"
                + "join tienda t on(p.codigo_tienda = t.codigo_tienda) where tub.codigo_usuario = ? order by (p.id_envio) desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar el producto en el catalgo de la tienda " + e);
        }
    }

    public static void traerTodasIncidencias(int usuario) {
        String query = "select i.id_incidencia, i.id_usuario, i.id_tienda, i.fecha, i.estado, i.solucion from incidencias i join tiendas_usuario_bodega tub on(i.id_tienda = tub.codigo_tienda) where tub.codigo_usuario = ? order by(i.id_incidencia) desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar todas las incidencias " + e);
        }
    }

    public static void traerIncidenciasActivas(int idUsuario) {
        String query = "select i.id_incidencia, i.id_usuario, i.id_tienda, i.fecha, i.estado, i.solucion from incidencias i join tiendas_usuario_bodega tub on(i.id_tienda = tub.codigo_tienda) where i.estado='ACTIVA' and tub.codigo_usuario = ? order by(i.id_incidencia) desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las incidencias activas: " + e);
        }
    }

    public static void actualizarEstadoDeIncidencia(int incidencia, String solucion) {
        String query = "update incidencias set estado ='SOLUCIONADA', solucion=? where id_incidencia =?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, solucion);
            stmt.setInt(2, incidencia);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error al actualizar las existencias en la bodega: " + e);
        }
    }

    public static void traerIncidenciasActivasPorTienda(int idUsuario, int tienda) {
        String query = "select i.id_incidencia, i.id_usuario, i.id_tienda, i.fecha, i.estado, i.solucion from incidencias i join tiendas_usuario_bodega tub on(i.id_tienda = tub.codigo_tienda) where i.estado='ACTIVA' and tub.codigo_usuario = ? and i.id_tienda=? order by(i.id_incidencia) desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            stmt.setInt(2, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las incidencias activas: " + e);
        }
    }

    public static void traerTodasDevolucines(int usuario) {
        String query = "select d.id_devolucion, d.codigo_usuario, d.codigo_tienda, d.fecha_devolucion, d.estado, d.total from devoluciones d join tiendas_usuario_bodega tub on(d.codigo_tienda = tub.codigo_tienda) where tub.codigo_usuario = ? order by(d.id_devolucion) desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, usuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar todas las incidencias " + e);
        }
    }

    public static void traerDevolucionesActivas(int idUsuario) {
        String query = "select d.id_devolucion, d.codigo_usuario, d.codigo_tienda, d.fecha_devolucion, d.estado, d.total from devoluciones d join tiendas_usuario_bodega tub on(d.codigo_tienda = tub.codigo_tienda) where d.estado='ACTIVA' AND tub.codigo_usuario = ? order by(d.id_devolucion) desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las incidencias activas: " + e);
        }
    }

    public static void actualizarProductosTienda(int cantidad, int tienda, int producto) {
        String query = "update productos_tienda set existencias = existencias - ? where codigo_tienda =? and codigo_producto=?;";
        System.out.println("actualizando productos tienda");
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cantidad);
            stmt.setInt(2, tienda);
            stmt.setInt(3, producto);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error al actualizar las existencias de la tienda: " + e);
        }
    }

    public static void actualizarProductosBodega(int cantidad, int producto) {
        String query = "update producto_bodega set existencias = existencias + ? where codigo_producto=?;";
        System.out.println("agregando cantidad al catalogo general");
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cantidad);
            stmt.setInt(2, producto);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error al actualizar las existencias de la bodega: " + e);
        }
    }

    public static void actualizarProductosDañados(int cantidad, int producto) {
        String query = "update producto_daniado set existencias = existencias + ? where codigo_producto=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, cantidad);
            stmt.setInt(2, producto);
            stmt.executeUpdate();
            stmt.close();
            System.out.println("actualizando productos dañados");
        } catch (Exception e) {
            System.out.println("Error al actualizar las existencias de los productos dañados: " + e);
        }
    }

    public static void actualizarEstadoDevolucion(String estado, int idDevolucion) {
        String query = "update devoluciones set estado =? where id_devolucion =?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, estado);
            stmt.setInt(2, idDevolucion);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error al actualizar el estado de la devolucion: " + e);
        }
    }

    public static void traerDevolucionesActivasFiltradasPorTienda(int idUsuario, int tienda) {
        String query = "select d.id_devolucion, d.codigo_usuario, d.codigo_tienda, d.fecha_devolucion, d.estado, d.total from devoluciones d join tiendas_usuario_bodega tub on(d.codigo_tienda = tub.codigo_tienda) where d.estado='ACTIVA' AND tub.codigo_usuario = ? and d.codigo_tienda=? order by(d.id_devolucion) desc;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idUsuario);
            stmt.setInt(2, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las incidencias activas: " + e);
        }
    }

    //REPORTES DEL USUARIO BODEGA
    public static void traerPedidosDadoTiendaYRangoFecha(int usuarioBod, String desde, String hasta, int tienda) {
        String query = "select e.id_envio, e.codigo_usuario, e.codigo_tienda, e.fecha_salida, e.estado, e.costo_total_envio from envios e join tiendas_usuario_bodega tub on(e.codigo_tienda = tub.codigo_tienda) where e.codigo_usuario = ? and (e.fecha_salida>=? and e.fecha_salida<=?) and e.codigo_tienda=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, usuarioBod);
            stmt.setString(2, desde);
            stmt.setString(3, hasta);
            stmt.setInt(4, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar los envios por rango fecha y tienda: " + e);
        }
    }

    public static void traerIncidenciasSolucionadasPorTiendaYFecha(int usuario, int tienda, String desde, String hasta) {
        String query = "select i.id_incidencia, i.id_usuario, i.id_tienda, i.fecha, i.estado, i.solucion from incidencias i join tiendas_usuario_bodega tub on(i.id_tienda=tub.codigo_tienda) where (i.estado = 'SOLUCIONADA' or i.estado='solucionada') and tub.codigo_usuario=? and i.id_tienda=? and (i.fecha>=? and i.fecha<=?);";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, usuario);
            stmt.setInt(2, tienda);
            stmt.setString(3, desde);
            stmt.setString(4, hasta);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las devoluciones filtardas por tienda y por fecha  " + e);
        }
    }

    public static void traerDevolucionesPorTiendaFechaYEstado(int usuario, int tienda, String desde, String hasta, String estado) {
        String query = "select d.id_devolucion, d.codigo_usuario, d.codigo_tienda, d.fecha_devolucion, d.estado, d.total, tub.codigo_usuario from devoluciones d join tiendas_usuario_bodega tub on(d.codigo_tienda=tub.codigo_tienda) where tub.codigo_usuario = ? and d.codigo_tienda = ? and (d.fecha_devolucion>=? and d.fecha_devolucion<=?) and d.estado=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, usuario);
            stmt.setInt(2, tienda);
            stmt.setString(3, desde);
            stmt.setString(4, hasta);
            stmt.setString(5, estado);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar las devoluciones filtardas por tienda y por fecha  " + e);
        }
    }

    //METODO DEL USUARIO ADMINISTRADOR
    public static void verificarTiendaUsuarioBodega(int tienda) {
        String query = "select * from tiendas_usuario_bodega where codigo_tienda = ?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, tienda);
            rs = stmt.executeQuery();
            //System.out.println(rs.getString(1));
        } catch (SQLException e) {
            System.out.println("Error al consultar la existencia de tiendausuariosBodega  " + e);
        }
    }

    //del usuario bodegas
    public static void actualizarCantidadProductoEnvio(int idEnvio, int idProducto, int nuevaCantidad, double costoU) {
        String query = "update listado_productos_envio set cantidad = ?, costo_subtotal=? where id_envio = ? and id_producto=?;";
        try {
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, nuevaCantidad);
            stmt.setDouble(2, Math.round((costoU * nuevaCantidad) * 100.0) / 100.0);
            stmt.setInt(3, idEnvio);
            stmt.setInt(4, idProducto);
            stmt.executeUpdate();
            stmt.close();
        } catch (Exception e) {
        }
    }
    
}
