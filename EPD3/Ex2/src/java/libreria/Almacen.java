package libreria;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

public class Almacen {

    public static List<Libro> consultaListaLibrosSolicitados(
            List<String> listaIsbns) throws Exception {
        Map<String, Libro> conjuntoLibros
                = new HashMap<String, Libro>(listaIsbns.size());
        ListIterator<String> iterator = listaIsbns.listIterator();
        while (iterator.hasNext()) {
            String isbn = iterator.next();
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

    public static Libro consultaLibro(int isbn) throws Exception {
        if (!Almacen.consultaDisponibilidadLibro(isbn)) {
            throw new Exception("Libro con ISBN " + isbn + " no esta disponible.");
        }
        boolean disponible = false;
        List<Libro> lista = Almacen.consultaLibrosDisponibles();
        Iterator it = lista.iterator();
        Libro libro = null;
        while (it.hasNext() && !disponible) {
            libro = (Libro) it.next();
            if (libro.getIsbn() == isbn) {
                disponible = true;
                libro.setCantidad(1);
            }
        }
        return libro;
    }

    public static boolean consultaDisponibilidadLibro(int isbn) {
        boolean disponible = false;
        List<Libro> lista = Almacen.consultaLibrosDisponibles();
        Iterator it = lista.iterator();
        while (it.hasNext() && !disponible) {
            Libro libro = (Libro) it.next();
            if (libro.getIsbn() == isbn) {
                disponible = true;
            }
        }
        return disponible;
    }

    public static List<Libro> consultaLibrosDisponibles() {
        List<Libro> lista = new ArrayList<Libro>(10);
        //libro 1
        Libro libro1 = new Libro();
        libro1.setAutor("Arturo Pérez Reverte");
        libro1.setTitulo("El Capitán Alatriste");
        libro1.setPrecio(10.00);
        libro1.setCantidad(0);
        libro1.setIsbn(101);
        lista.add(libro1); //libro 2
        Libro libro2 = new Libro();
        libro2.setAutor("Neil Gaiman");
        libro2.setTitulo("Humos y Espejos");
        libro2.setPrecio(12.00);
        libro2.setCantidad(0);
        libro2.setIsbn(102);
        lista.add(libro2); //libro 3
        Libro libro3 = new Libro();
        libro3.setAutor("Lewis Carroll");
        libro3.setTitulo("Alicia en el País de las Maravillas");
        libro3.setPrecio(15.00);
        libro3.setCantidad(0);
        libro3.setIsbn(103);
        lista.add(libro3);
        //libro 4
        Libro libro4 = new Libro();
        libro4.setAutor("Philip K. Dick");
        libro4.setTitulo("Cuentos Completos I");
        libro4.setPrecio(14.50);
        libro4.setCantidad(0);
        libro4.setIsbn(104);
        lista.add(libro4);
        //libro 5
        Libro libro5 = new Libro();
        libro5.setAutor("H. P. Lovecraft");
        libro5.setTitulo("La Llamada de Cthulhu");
        libro5.setPrecio(11.00);
        libro5.setCantidad(0);
        libro5.setIsbn(105);
        lista.add(libro5); //libro 6
        Libro libro6 = new Libro();
        libro6.setAutor("Arturo Pérez Reverte");
        libro6.setTitulo("La Piel del Tambor");
        libro6.setPrecio(18.00);
        libro6.setCantidad(0);
        libro6.setIsbn(106);
        lista.add(libro6);
        //libro 7
        Libro libro7 = new Libro();
        libro7.setAutor("Eduardo Punset");
        libro7.setTitulo("El Viaje a la Felicidad");
        libro7.setPrecio(13.50);
        libro7.setCantidad(0);
        libro7.setIsbn(107);
        lista.add(libro7);
        //libro 8
        Libro libro8 = new Libro();
        libro8.setAutor("Juan Pérez Mercader");
        libro8.setTitulo("¿Qué Sabemos del Universo?");
        libro8.setPrecio(11.50);
        libro8.setCantidad(0);
        libro8.setIsbn(108);
        lista.add(libro8);
        return lista;
    }
}
