/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.detailCommande;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.DetailCommande;
import modele.Profil;

/**
 *
 * @author Manda
 */
public class SupprimerDetailCommandeModification extends HttpServlet {

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

            Boolean authentification = Profil.authentifier(2, request);
            if (!authentification) {
                response.sendRedirect("PageFormulaireLogin");
            }

            int idProduit = Integer.valueOf(request.getParameter("idProduit"));
            HttpSession session = request.getSession();
            List<DetailCommande> listeDetailCommandeAjout = (List<DetailCommande>) session.getAttribute("listeDetailCommandeAjout");
            for (int i = 0; i < listeDetailCommandeAjout.size(); i++) {
                if (listeDetailCommandeAjout.get(i).getProduit().getIdProduit() == idProduit) {
                    listeDetailCommandeAjout.remove(i);
                    break;
                }
            }

            response.sendRedirect("ModifierCommande?idCommande=" + request.getParameter("commande"));
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
