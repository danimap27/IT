package libreria;



public class Libro {

    private String titulo = null;
    private String autor = null;
    private int cantidad = -1;
    private int isbn = -1;
    private double precio = Double.NaN;

    public Libro() {
        this.setAutor("");
        this.setTitulo("");
        this.setPrecio(0.);
        this.setCantidad(0);
        this.setIsbn(0);
    }

    public String getTitulo() {
        return titulo;
    }

    public boolean equals(Object olibro) {
        boolean eq = false;
        Libro libro = (Libro) olibro;
        if (this.getTitulo().equals(libro.getTitulo())
                && this.getAutor().equals(libro.getAutor())
                && this.getPrecio() == libro.getPrecio()
                && this.getIsbn() == libro.getIsbn()) {
            eq = true;
        }
        return eq;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public int getIsbn() {
        return this.isbn;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void incrementaCantidad() {
        this.cantidad++;
    }

    public void disminuyeCantidad() {
        this.cantidad--;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
}
