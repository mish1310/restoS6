/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.produit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Commande;
import modele.DBConnection;
import modele.DetailCommande;
import modele.Produit;

/**
 *
 * @author Manda
 */
public class ConstituantPlatsGeneralise extends HttpServlet {

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
        Connection con = null;
        try {
            con = DBConnection.getConnection();
            // recuperation des dates
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date1 = dateFormat.parse(request.getParameter("date1"));
            Date date2 = dateFormat.parse(request.getParameter("date2"));
            List<DetailCommande> listeDetailsCommande = DetailCommande.getPlatsFabrique(request.getParameter("date1"), request.getParameter("date2"), con);
            // recuperation des ingredients utilises avec leur quantite respectif
            List<Object[]> ingredientsUtilises = Produit.getIngredientsUtilises(listeDetailsCommande, con);
            request.setAttribute("ingredientsUtilises", ingredientsUtilises);
            // recuperation du somme du prix des ingredients
            double sommePrixIngredients = 0;
            for(int i = 0; i < ingredientsUtilises.size(); i++){
                double prixIngredient = (double)(ingredientsUtilises.get(i)[2]);
                sommePrixIngredients += prixIngredient;
            }
            request.setAttribute("sommePrixIngredients", sommePrixIngredients);
            con.close();
            RequestDispatcher dispat = request.getRequestDispatcher("listeConstituantsPlatsGeneralise.jsp");
            dispat.forward(request, response);
        } catch (Exception ex) {
            try {
                con.close();
            } catch (Exception e) {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.print(ex.getMessage());
                }
            }
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.print(ex.getMessage());
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
