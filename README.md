# BLOQUE I

## TEMA 1.1
### Elementos básicos de la sintaxis [JSP](https://docs.oracle.com/javaee/5/tutorial/doc/docinfo.html):
1. Incrustación de código (Scriptlet):

    Se utiliza para ejecutar código Java directamente en la página JSP.
    Se escribe entre <% y %>.
    
    Ejemplo:
    ```html
    <%
    // Imprimir la fecha actual
    System.out.println(new java.util.Date());
    %>
    ```
2. Expresiones:

    Se utilizan para evaluar expresiones Java y mostrar el resultado en la página.
    Se escribe entre <%= y %>.
    
    Ejemplo:
    ```HTML
    <h1>Bienvenido, <%= usuario.getNombre() %>!</h1>
    ```

3. Directivas:

    Se utilizan para configurar la página JSP, como la página de código o el tipo de contenido.
    Se escribe entre <%@ y %>.
    
    Ejemplo:
    ```HTML
    <%@ page language="java" contentType="text/html; charset=UTF-8" %>
    ```
    
4. Comentarios:

    Se utilizan para agregar comentarios al código JSP.
    Se escribe entre <%-- y --%>.
   
    Ejemplo:
    ```HTML
    <%-- Este es un comentario --%>
    ```
    
6. Declaración de atributos y métodos propios:

    Se utiliza para declarar variables, métodos y otros elementos que se usarán en la página JSP.
    Se escribe entre <%! y %>.
    
    Ejemplo:
    ```HTML
    <%!
    private String nombre = "Juan";
    
    public String getNombre() {
    return nombre;
    }
    %>
    ```

#### En resumen:

  Los elementos básicos de la sintaxis JSP te permiten:

  Ejecutar código Java en la página.
  Mostrar el resultado de expresiones Java en la página.
  Configurar la página JSP.
  Agregar comentarios al código JSP.
  Declarar variables, métodos y otros elementos que se usarán en la página JSP.
