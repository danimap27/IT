<%
    String usuario = request.getParameter("usuario");
    String clave = request.getParameter("clave");
    if (usuario.equals(clave)) {
        session.setAttribute("usuario", usuario);
        String fuente = (String) session.getAttribute("fuente");
        session.removeAttribute("fuente");
        response.sendRedirect(request.getContextPath()+fuente);
} else {
    session.setAttribute("fallo", "si");
    response.sendRedirect(request.getContextPath()+"acceso.jsp");

    }
%>
