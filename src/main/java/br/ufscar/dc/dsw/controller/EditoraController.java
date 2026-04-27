package br.ufscar.dc.dsw.controller;
import br.ufscar.dc.dsw.dao.EditoraDAO;
import br.ufscar.dc.dsw.domain.Editora;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/editoras/*")
public class EditoraController extends HttpServlet {
    private EditoraDAO dao;
    @Override public void init() { dao = new EditoraDAO(); }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        if (action == null) action = "";
        try {
            switch (action) {
                case "/cadastro": request.getRequestDispatcher("/editora/formulario.jsp").forward(request, response); break;
                case "/inserir": dao.insert(new Editora(request.getParameter("cnpj"), request.getParameter("nome"))); response.sendRedirect("lista"); break;
                case "/remover": dao.delete(new Editora(Long.parseLong(request.getParameter("id")))); response.sendRedirect("lista"); break;
                case "/edicao": request.setAttribute("editora", dao.get(Long.parseLong(request.getParameter("id")))); request.getRequestDispatcher("/editora/formulario.jsp").forward(request, response); break;
                case "/atualizar": dao.update(new Editora(Long.parseLong(request.getParameter("id")), request.getParameter("cnpj"), request.getParameter("nome"))); response.sendRedirect("lista"); break;
                default: request.setAttribute("listaEditoras", dao.getAll()); request.getRequestDispatcher("/editora/lista.jsp").forward(request, response); break;
            }
        } catch (Exception e) { throw new ServletException(e); }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { doGet(request, response); }
}