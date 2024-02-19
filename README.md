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

## TEMA 1.2
### Objetos implícitos:

* [out](#out): Objeto que permite escribir contenido en la respuesta HTTP.
* [request](#request): Objeto que representa la solicitud HTTP actual.
* [response](#response): Objeto que representa la respuesta HTTP que se enviará al cliente.
* [session](#session): Objeto que representa la sesión actual del usuario.
* [application](#application): Objeto que representa la aplicación web en la que se ejecuta la página JSP.
* [config](#config): Objeto que proporciona acceso a la configuración de la página JSP actual.

#### Out:
<a id="out"></a>
Gestión del buffer:

* clearBuffer() Limpia el contenido del buffer
* flush() Vacia el stream
* getBufferSize() Devuelve el tamaño del buffer
* getRemaining() Devuelve cuántos bytes están libres
* isAutoFlush() Tindica si el autolimpiado está activado

Salida:
* print()
* println()

#### Request:
<a id="request"></a>
Información sobre URL:

* getContextPath()
* getPathInfo()
* getPathTranslated()
* getQueryString()
* getRequestURI()

Información sobre la cabecera de la petición:

* getHeaderNames()
* getHeader(String name)
* getHeaders(String name)
* getDateHeaders(String name)
* getMethod()

Lectura de cookies:

* getCookies()
  
Gestión de sesión

* getRequestSessionId()
* getSession()
* isRequestedSessionIdValid()
  
Gestión de usuarios:

* getRemoteUser()

#### Response:
<a id="response"></a>
Gestión de cookies:

* addCookie(Cookie cookie)

Cabeceras de respuesta:

* addHeader(String name, String value)
* addIntHeader(String name, int value)

Redirecciones:

* encodeRedirectURL(String url)
* sendRedirect(String location)

Errores:

* sendError(int sc)
* sendError(int sc, String message)

#### Session:
<a id="session"></a>
Lectura y escritura de atributos:

* getAttribute(String name)
* getAttributeNames()
* removeAttribute(String name)
* setAttribute(String name, Object value)

Control de tiempos:

* getCreationTime()
* getLastAccessedTime()
* getMaxInactiveInterval()
* setMaxInactiveInterval()

Datos:

* getId()
* isNew()

Cierre:

* Invalidate()

#### Application:
<a id="application"></a>

Gestión de datos permanentes a nivel de aplicación web:

* getAttribute(String name)
* getAttributeNames()
* removeAttribute(String name)
* setAttribute(String name, Object value)

Acceso a parámetros de configuración de la aplicación web:

* getInitParameter(String name)
* getInitParameterNames()

Acceso a datos de la aplicación:

* getServletContextName()
* getContextPath()
  
Acceso a datos del servidor:

* getMajorVersion()
* getMinorVersion()
* getServerInfo()
* getMimeType(String file)

Escritura en el log del servidor:

* log(String msg)
* log(String msg, Throwable throwable)

Acceso a recursos:
* getRealPath(String path)
* getResource(String path)
* getResourceAsStream(String path)
* getResourcePaths(String Path)

#### Config:
<a id="config"></a>
Métodos destacados:

* getInitParameter(String name)
* getInitParameterNames()

### Acciones en JSP

Se incluyen como etiquetas en las páginas JSP y le dan
instrucciones al contenedor JSP sobre qué enviar a la
salida

```java
<jsp:accion atrib1=“valor” atrib2=“valor2” … />
```

#### Acciones por defecto

* jsp:forward: Reenvío de peticiones a otra página
* jsp:include: Inclusión de ficheros
* jsp:plugin: Inclusión de applets en las páginas
* jsp:useBean: Uso de beans en las páginas JSP.
* jsp:setProperty: Establecimiento de una propiedad
* jsp:getProperty: Lectura de una propiedad

## TEMA 1.3
### Ciclo de vida de las páginas JSP
* Inicialización: Construcción e inicialización de variables del Servlet que se construye en base a la página JSP
```java
    <%@ page language="java" contentType="text/html" %>
    <%@ page import="java.util.Date" %>
    <%! int globalCounter = 0;
        java.util.Date startDate;
        public void jspInit( ) {
            startDate = new java.util.Date( );
        }

        public void jspDestroy( ) {
            ServletContext context = getServletConfig().getServletContext( );
            context.log("test.jsp was visited " + globalCounter + " times between " + startDate + " and " + (new Date( )));
        }
    %>
```
* Ejecución: Contrucción y carga de todos los elementos de la respuesta que va a dar la página JSP al cliente.
* Destrucción: Código que se ejecutará justo antes de la destrucción del Servlet
