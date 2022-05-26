/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.commande;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.Commande;
import modele.DetailCommande;
import modele.Serveur;
import modele.Table;

/**
 *
 * @author User
 */
public class InsertionCommande extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        try{
            Commande c = new Commande();
            // recuperation du liste des detailsCommande
            HttpSession session = request.getSession();
            List<DetailCommande> listeDetailCommande = (List<DetailCommande>)session.getAttribute("listeDetailCommande");
            
            
            c.setListeDetailCommande(listeDetailCommande);
            
            Calendar dateAct = Calendar.getInstance();
            c.setDateCommande(dateAct.getTime());
            
            
            Serveur s = new Serveur();
            s.setIdServeur(Integer.valueOf(request.getParameter("serveur")));
            for(int i = 0; i < listeDetailCommande.size(); i++){
                listeDetailCommande.get(i).setServeur(s);
                listeDetailCommande.get(i).setDateCommande(dateAct.getTime());
            }
            
            Table table = new Table();
            table.setIdTable(Integer.valueOf(request.getParameter("table")));
            c.setTable(table);
            
            // insertion de la commande
            c.insertCommande();
            
            session.removeAttribute("listeDetailCommande");
            
            // redirection vers la formulaire d'insertion de commande
            response.sendRedirect("PageFormulaireInsertionCommande");
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
