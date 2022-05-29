/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.produit;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Produit;

/**
 *
 * @author Manda
 */
public class ModifierRecette extends HttpServlet {

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

        try {
            // Modification de constituant
            if (request.getParameter("produitConstituant") != null) {
                Produit produitConstituant = new Produit();
                produitConstituant.setIdProduit(Integer.valueOf(request.getParameter("produitConstituant")));

                Produit produitConstitue = new Produit();
                produitConstitue.setIdProduit(Integer.valueOf(request.getParameter("produitConstitue")));

                Double quantite = Double.valueOf(request.getParameter("quantite"));

                Produit.updateRecette(produitConstitue, produitConstituant, quantite);
                
                response.sendRedirect("RecetteProduit?idProduit=" + Integer.valueOf(request.getParameter("produitConstitue")));
            } // Suppression de constituant
            else if (request.getParameter("supprimer") != null) {
                Produit produitConstituant = new Produit();
                produitConstituant.setIdProduit(Integer.valueOf(request.getParameter("supprimer")));

                Produit produitConstitue = new Produit();
                produitConstitue.setIdProduit(Integer.valueOf(request.getParameter("idProduit")));

                Produit.supprimerRecette(produitConstitue, produitConstituant);
                
                response.sendRedirect("RecetteProduit?idProduit=" + Integer.valueOf(request.getParameter("idProduit")));
            } // Ajout de constituant
            else if (request.getParameter("idProduit") != null) {
                Produit produitConstitue = new Produit();
                produitConstitue.setIdProduit(Integer.valueOf(request.getParameter("idProduit")));
                
                Produit ingredient = new Produit();
                ingredient.setIdProduit(Integer.valueOf(request.getParameter("ingredient")));
                
                Double quantite = Double.valueOf(request.getParameter("quantite"));
                
                Produit.insertRecette(produitConstitue, ingredient, quantite);
                
                response.sendRedirect("RecetteProduit?idProduit=" + Integer.valueOf(request.getParameter("idProduit")));
            }

            // redirection
        } catch (Exception ex) {
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
