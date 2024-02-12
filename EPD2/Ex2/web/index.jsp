
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    if(request.getParameter("pagina") != null){
        String usuario = request.getParameter("usuario");
        String pagina = request.getParameter("pagina");
        
        Cookie c = new Cookie("usuario", usuario);
        response.addCookie(c);
        
        response.sendRedirect(pagina+".jsp");
    }



%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT - EPD02 - Experimento02</title>
    </head>
    <body>
        <h1>IT - EPD02 - Experimento02</h1>        
        <h2>Identifíquese y seleccione dónde quiere ir:</h2>
        <form action="#" method="post">
            <table border="1" cellspacing="2" cellpadding="2">
                <tr> 
                    <td>Usuario</td> 
                    <td><input type="text" name="usuario"></td> 
                </tr>
                <tr> 
                    <td>A qué página quieres ir?</td>
                    <td>
                        <select name="pagina">
                            <option value="pA">Página A</option>
                            <option value="pB">Página B</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="btnEnviar" value="Enviar" size="2"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
