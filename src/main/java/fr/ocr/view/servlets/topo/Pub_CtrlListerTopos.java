package fr.ocr.view.servlets.topo;

import fr.ocr.business.topo.CtrlMetierTopo;
import fr.ocr.model.entities.DbTopo;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;


@WebServlet(description = "Servlet qui liste tous les topos DISPONIBLES (publi� et non r�serv�) du site",
        name = "Pub_CtrlListerTopos",
        urlPatterns = {"/Pub_CtrlListerTopos"})

public class Pub_CtrlListerTopos extends HttpServlet {

    private static final long serialVersionUID =1L;

    public Pub_CtrlListerTopos() {
        super();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try  {
            CtrlMetierTopo ctrlMetierTopo = CtrlMetierTopo.CTRL_METIER_TOPO;
            List<DbTopo> dbTopos = ctrlMetierTopo.listerTousTopos();
            request.setAttribute("dbTopos",dbTopos);

            RequestDispatcher requestDispatcher = this.getServletContext().getNamedDispatcher("Pri_ListeDesTopos");
            requestDispatcher.forward(request,response);

        } catch (Exception e) {
            request.removeAttribute("dbTopos");
            request.setAttribute("messageErreur"," "+e.getLocalizedMessage()+" "+ Arrays.toString(e.getStackTrace()));
            RequestDispatcher requestDispatcher = this.getServletContext().getNamedDispatcher("Pri_PageErreurInterne");
            requestDispatcher.forward(request,response);

        }
    }
}