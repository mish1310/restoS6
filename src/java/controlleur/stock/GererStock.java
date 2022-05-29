/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.stock;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Produit;
import modele.Stock;

/**
 *
 * @author Manda
 */
public class GererStock extends HttpServlet {

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
            List<Stock> stocks = Stock.selectAll();
            request.setAttribute("stocks", stocks);

            List<Produit> produits = Produit.selectAllOrderByIntitule();
            request.setAttribute("produits", produits);

            RequestDispatcher dispat = request.getRequestDispatcher("produit/stock.jsp");
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
            // recherche
            if (request.getParameter("rechercher") != null) {
                Produit produit = null;
                Date dateInf = null;
                Date dateSup = null;
                if (request.getParameter("produit") != null && request.getParameter("produit").length() != 0 ) {
                    produit = new Produit();
                    produit.setIntitule(request.getParameter("produit"));
                }
                if (request.getParameter("dateInf") != null && request.getParameter("dateInf").length() != 0 ) {
                    dateInf = new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("dateInf"));
                }
                if (request.getParameter("dateSup") != null && request.getParameter("dateSup").length() != 0) {
                    dateSup = new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("dateSup"));
                }
                
                List<Stock> stocks = Stock.rechercher(produit, dateInf, dateSup);
                request.setAttribute("stocks", stocks);

                List<Produit> produits = Produit.selectAllOrderByIntitule();
                request.setAttribute("produits", produits);

                RequestDispatcher dispat = request.getRequestDispatcher("produit/stock.jsp");
                dispat.forward(request, response);
            } // ajout de stock
            else if (request.getParameter("ajout") != null) {
                Stock stock = new Stock();
                Produit produit = new Produit();
                produit.setIdProduit(Integer.valueOf(request.getParameter("produit")));
                stock.setProduit(produit);
                stock.setPrixUnitaire(Double.valueOf(request.getParameter("prixUnitaire")));
                stock.setQuantite(Integer.valueOf(request.getParameter("quantite")));
                Date d = new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("dateStockage"));
                stock.setDateStock(d);
                stock.insert();

                response.sendRedirect("GererStock");
            }
            // suppression de stock

            // Modification de stock
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
