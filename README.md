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
* Ejecución: Contrucción y carga de todos los elementos de la respuesta que va a dar la página JSP al cliente.
* Destrucción: Código que se ejecutará justo antes de la destrucción del Servlet.

Ejemplo:
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
El ciclo de vida puede verse alterado:
* Cuando se produce una excepción que deja el servidor inservible
* Cuando se pasa el control del procesamiento de la solicitud a otra "entidad"

### Arquitectura MVC
* Modelo: Encapsula la lógica de negocio y datos.
* Vista: Se encarga de la presentación.
* Controlador: ENcapsula la lógica de la aplicacion.

### Tipos de arquitecturas
* 1 capa: Página-céntrica
    * JSP: Controlador, vista y modelo.
        * Ventajas: Fácil de implementar.
        * Desventajas: Tienes que arreglar todo por copia y pega no con bloques, inmantenible y dificil para los diseñadores.
        * Apropiada para aplicaciones simples.
* 2 capas:
    * JavaBean: Modelo
    * JSP: Controlador y vista
        * Ventajas: Simple de implementar y permite la reutilización del modelo.
        * Desventajas: Las mismas que las de 1 capa.
        * Apropiadas para aplicaciones pequeñas y medianas.
* 3 capas:
    * JavaBean: Modelo
    * JSP: vista
    * Servlet: controlador
        * Ventajas: Reusabilidad, mantenimiento y abstración.
        * Desventajas: Inversión inicial muy elevada.
        * Apropiadas para aplicaciones medianas y grandes.

 ## TEMA 1.4

**Carga de JSTL:**

* Incluir la directiva `taglib`:
```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```
* Prefijos y URIs por defecto:

| Prefijo | URI | Descripción |
|---|---|---|
| c | [http://java.sun.com/jsp/jstl/core](http://java.sun.com/jsp/jstl/core) | Core |
| x | [http://java.sun.com/jsp/jstl/xml](http://java.sun.com/jsp/jstl/xml) | XML Processing |
| fmt | [http://java.sun.com/jsp/jstl/fmt](http://java.sun.com/jsp/jstl/fmt) | I18N & Formatting |
| sql | [http://java.sun.com/jsp/jstl/sql](http://java.sun.com/jsp/jstl/sql) | Database Access |
| fn | [http://java.sun.com/jsp/jstl/functions](http://java.sun.com/jsp/jstl/functions) | Functions |


**El lenguaje de Expresiones EL:**

* Permite acceder a datos y establecer condiciones con una sintaxis sencilla.
* Inspirado en JavaScript.
* Las expresiones se marcan con `${ … }`.

**Acceso a propiedades de objetos y JavaBeans:**

* Notación válida:
    * `${myObj.myProperty}`
    * `${myObj['myProperty']}`
    * `${myObj[varWithTheName]}`

**Operadores EL:**

| Operador | Descripción |
|---|---|
| . | Accede a una propiedad |
| [] | Accede a un elemento de un array/lista |
| () | Agrupa una subexpression |
| + | Suma |
| - | Resta o negación de un número |
| * | Multiplicación |
| / | División |
| % | Módulo (resto) |
| == | Comprueba igualdad |
| != | Comprueba desigualdad |
| < | Comprueba menor que |
| > | Comprueba mayor que |
| <= | Comprueba menor o igual que |
| >= | Comprueba mayor o igual que |
| && | Comprueba AND lógico |
| || | Comprueba OR lógico |
| ! | Complemento binario booleano |
| empty | Comprueba un valor vacío (null, string vacío, o una colección vacía) |

**Variables implícitas EL:**

| Variable | Descripción |
|---|---|
| param | Una collection de todos los parámetros de la solicitud como un sólo valor string para cada parámetro. |
| paramValues | Una collection de todos los valores de los parámetros de la solicitud como un array de valores string por cada parámetro. (Valores múltiples por parámetro) |
| header | Una collection de todas las cabeceras de solicitud como un sólo valor string por cada cabecera. |
| headerValues | Una collection de todos los valores de cabecera de la solicitud como un array de valores string por cada cabecera. (Valores múltiples por cabecera) |
| cookie | Una collection con todas las cookies de la solicitud en un sólo ejemplar de javax.servlet.http.Cookie por cada cookie. |
| initParams | Una collection de todos los parámetros de inicialización de la aplicación en un sólo valor string por cada parámetro. |
| pageContext | Un ejemplar de la clase javax.servlet.jspPageContext. |
| pageScope | Acceso a session, request, etc. |
| requestScope |  |
| sessionScope |  |
| applicationScope |  |

**Ejemplos:**

* `${param.listType}`
* `${header['User-Agent']}`

**Literales en EL:**

| Tipo de Literal | Descripción |
|---|---|
| String | Encerrado con comillas simples o dobles. |
| Integer | Un signo opcional (+ o -) seguido por digitos entre 0 y 9. |
| Floating | Lo mismo que un literal entero, excepto que usa un punto como separador de la parte fraccional y que se puede especificar un exponente con e o E, seguido por un literal entero. |
| Boolean | true o false. |
| Null | null. |

**Limitación del ámbito de búsqueda de una variable:**

* Cualquiera: `${customer}`
* Página: `${pageScope.customer}`
* Petición: `${requestScope.customer}`
* Sesión: `${sessionScope.customer}`
* Aplicación: `${applicationScope.customer}`

**JSTL Core:**

* **Procesamiento condicional:**

```jsp
<c:if test="${param.age >= 18}">
    Welcome, ${param.name}.
</c:if>
```

* **Iteración:**

```jsp
<c:forEach var="item" items="${list}">
    ${item}
</c:forEach>

