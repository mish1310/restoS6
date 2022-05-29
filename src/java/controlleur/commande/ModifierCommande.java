/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.commande;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.Commande;
import modele.DetailCommande;
import modele.Produit;
import modele.Profil;
import modele.Serveur;

/**
 *
 * @author Manda
 */
public class ModifierCommande extends HttpServlet {

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
        try {
            Boolean authentification = Profil.authentifier(2, request);
            if(!authentification){
                response.sendRedirect("PageFormulaireLogin");
            }
            
            response.setContentType("text/html;charset=UTF-8");

            int idCommande = Integer.valueOf(request.getParameter("idCommande"));

            Commande commande = new Commande();
            commande.setIdCommande(idCommande);
            request.setAttribute("commande", commande);

            // Liste des serveur
            List<Serveur> listeServeur = new Serveur().selectAll();
            request.setAttribute("listeServeur", listeServeur);

            // Liste des produits vendable
            List<Produit> listeProduitVendable = new Produit().selectAllVendable();
            request.setAttribute("listeProduitVendable", listeProduitVendable);

            RequestDispatcher dispat = request.getRequestDispatcher("commande/modifierCommande.jsp");
            dispat.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
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

        try {
            Commande commande = new Commande();
            commande.setIdCommande(Integer.valueOf(request.getParameter("commande")));
            Serveur serveur = new Serveur();
            serveur.setIdServeur(Integer.valueOf(request.getParameter("serveur")));
            commande.setServeur(serveur);

            HttpSession session = request.getSession();

            List<DetailCommande> produitAjout = (List<DetailCommande>) session.getAttribute("listeDetailCommandeAjout");
            commande.ajouterDetailCommande(produitAjout);
            
            session.removeAttribute("listeDetailCommandeAjout");

            response.sendRedirect("ModifierCommande?idCommande=" + commande.getIdCommande());
        }
        catch(Exception ex){
            ex.printStackTrace();
        }

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
