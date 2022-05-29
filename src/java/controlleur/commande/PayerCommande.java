/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.commande;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Commande;
import modele.DetailCommande;
import modele.Paiement;
import modele.TypePaiement;

/**
 *
 * @author Manda
 */
public class PayerCommande extends HttpServlet {

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
            // recuperation des objets
            Commande commande = new Commande(Integer.valueOf(request.getParameter("idCommande")));
            commande = commande.select();
            request.setAttribute("commande", commande);

            // liste type paiement
            List<TypePaiement> listeTypePaiement = TypePaiement.selectAll();
            request.setAttribute("listeTypePaiement", listeTypePaiement);

            // liste des details du commande
            List<DetailCommande> detailsCommande = commande.getListeDetailCommandeFromDB();
            request.setAttribute("detailsCommande", detailsCommande);

            // variale d'erreur
            if (request.getParameter("erreurPaiement") != null) {
                request.setAttribute("erreurPaiement", true);
            }

            RequestDispatcher dispat = request.getRequestDispatcher("commande/payementCommande.jsp");
            dispat.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.print(ex.getMessage());
            }
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
            commande.setIdCommande(Integer.valueOf(request.getParameter("idCommande")));
            commande = commande.select();

            // controle du montant de paiement
            Double montant = Double.valueOf(request.getParameter("montant"));
            if (montant > (commande.getPrixTotal() - commande.getSommePayement())) {
                response.sendRedirect("PayerCommande?idCommande=" + commande.getIdCommande() + "&erreurPaiement=" + 1);
            } else {
                // insertion du paiement
                Paiement paiement = new Paiement();
                paiement.setCommande(commande);
                paiement.setMontant(montant);
                TypePaiement typePaiement = new TypePaiement(Integer.valueOf(request.getParameter("typePaiement")));
                paiement.setTypePayement(typePaiement);
                Calendar dateAct = Calendar.getInstance();
                paiement.setDatePayement(dateAct.getTime());
                paiement.insert();
                response.sendRedirect("PayerCommande?idCommande=" + commande.getIdCommande());
            }

        } catch (Exception ex) {
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
