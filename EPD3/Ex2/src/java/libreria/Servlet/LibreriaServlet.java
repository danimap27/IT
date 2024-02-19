package libreria.Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import libreria.Almacen;



public class LibreriaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            String accion = request.getParameter("Accion");
            if (accion.equals("agregar")) {
                List<String> listaIsbns = (List<String>) session.getAttribute("tienda.carro");
                String isbn = request.getParameter("seleccionLibros");
                if (Almacen.consultaDisponibilidadLibro(Integer.parseInt(isbn))) {
                    if (listaIsbns == null) {
                        listaIsbns = new ArrayList<String>(10);
                    }
                    listaIsbns.add(isbn);
                    session.setAttribute("tienda.carro", listaIsbns);
                } else {
                    PrintWriter out = response.getWriter();
                    out.print("" + isbn);
                    out.close();
                }
                String url = "/Tienda.jsp";
                ServletContext sc = getServletContext();
                RequestDispatcher rd = sc.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (accion.equals("comprar")) {
                String url = "/Compra.jsp";
                ServletContext sc = getServletContext();
                RequestDispatcher rd = sc.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }
}
