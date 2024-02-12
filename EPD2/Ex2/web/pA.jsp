<%
    Cookie[] cookies = request.getCookies();
    String usuario = "";
    int i = 0;
    boolean enc = false;
    while(i<cookies.length && !enc){
        if(cookies[i].getName().equals("usuario")){
            usuario = cookies[i].getValue();
            enc = true;
        }
        i++;
    }
           



%>


<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IT - EPD02 - Experimento02 - Página A</title>
    </head>
    <body>
        <h1>IT - EPD02 - Experimento02 - Página A</h1>
        <h2>Bienvenido <%=usuario%></h2>
    </body>
</html>
