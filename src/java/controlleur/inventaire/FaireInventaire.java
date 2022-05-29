/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.inventaire;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Produit;
import modele.Inventaire;

/**
 *
 * @author Manda
 */
public class FaireInventaire extends HttpServlet {

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

        // si il faut faire l'inventaire de tous les produits
        if (request.getParameter("tout") != null) {
            try{
                Inventaire inventaire = new Inventaire();
                Calendar dateAct = Calendar.getInstance();
                inventaire.setDateInventaire(dateAct.getTime());
                inventaire.faireInventaire();
                response.sendRedirect("Inventaire");
            }
            catch(Exception ex){
                ex.printStackTrace();
            }
        } // si il faut faire l'inventaire d'un produit
        else {
            try {
                Produit produit = new Produit(Integer.valueOf(request.getParameter("idProduit")));
                SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
                Date dateInventaire = formater.parse(request.getParameter("dateInventaire"));
                Inventaire inventaire = new Inventaire(produit, dateInventaire);
                inventaire.faireInventaireProduit();
                request.setAttribute("inventaire", inventaire);
                RequestDispatcher dispat = request.getRequestDispatcher("resultatInventaire.jsp");
                dispat.forward(request, response);
            } catch (Exception ex) {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.print(ex.getMessage());
                }
            }
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
