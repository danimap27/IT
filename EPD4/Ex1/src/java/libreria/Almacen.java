package libreria;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import java.util.Set;

public class Almacen {

    private static final String controlador = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost/ALMACEN";
    private static final String usuario = "root";
    private static final String clave = "";

    static {
        try {
            Class.forName(controlador);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading JDBC driver"
                    + " class. Cause: " + e);
        }
    }

    public static List<Libro> consultaListaLibrosSolicitados(List<String> listaIsbns) throws Exception {
        Map<String, Libro> conjuntoLibros = new HashMap<String, Libro>(listaIsbns.size());
        for (String isbn : listaIsbns) {
            Libro libro = null;
            if (!conjuntoLibros.containsKey(isbn)) {
                libro = Almacen.consultaLibro(Integer.parseInt(isbn));
            } else {
                libro = conjuntoLibros.get(isbn);
                conjuntoLibros.remove(isbn);
                libro.incrementaCantidad();
            }
            conjuntoLibros.put(isbn, libro);
        }
//pasamos a lista
        Set<String> conjuntoIsbns = conjuntoLibros.keySet();
        Iterator<String> it = conjuntoIsbns.iterator();
        List<Libro> listaLibros = new ArrayList<Libro>(conjuntoIsbns.size());
        while (it.hasNext()) {
            listaLibros.add(conjuntoLibros.get(it.next()));
        }
//pasamos a
        return listaLibros;
    }

    public static Libro ResultSetTolibro(ResultSet resultado) throws SQLException {
        Libro libro = new Libro();
        libro.setAutor(resultado.getString("autor"));
        libro.setTitulo(resultado.getString("titulo"));
        libro.setPrecio(resultado.getDouble("precio"));
        libro.setIsbn(resultado.getInt("isbn"));
        return libro;
    }

    public static Libro consultaLibro(int isbn) throws SQLException {
        Libro libro = null;
        Connection conexion = DriverManager.getConnection(url, usuario,
                clave);
        //solicitud/recepcion de peticiones
        Statement solicitud = (Statement) conexion.createStatement();
        ResultSet resultados = solicitud.executeQuery(
                "SELECT * FROM Libro WHERE isbn = " + isbn);
        if (resultados.next()) {
            libro = Almacen.ResultSetTolibro(resultados);
            libro.setCantidad(1);
        }
        resultados.close();
        solicitud.close();
        conexion.close();
        return libro;
    }

    public static List<Libro> consultaLibrosDisponibles()
            throws SQLException {
        List<Libro> lista = new ArrayList<Libro>();
        Connection conexion = DriverManager.getConnection(url, usuario,
                clave); //solicitud/recepcion de peticiones
        Statement solicitud = (Statement) conexion.createStatement();
        ResultSet resultados = solicitud.executeQuery("SELECT * FROM Libro");
        while (resultados.next()) {
            Libro libro = Almacen.ResultSetTolibro(resultados);
            libro.setCantidad(0);
            lista.add(libro);
        }
        resultados.close();
        solicitud.close();
        conexion.close();
        return lista;
    }
}
