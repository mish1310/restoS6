/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.inventaire;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Produit;
import modele.Profil;

/**
 *
 * @author Manda
 */
public class Inventaire extends HttpServlet {

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
            Boolean authentification = Profil.authentifier(1, request);
            if(!authentification){
                response.sendRedirect("PageFormulaireLogin");
            }
            
            List<modele.Inventaire> inventaires = modele.Inventaire.selectAll();
            request.setAttribute("inventaires", inventaires);
            RequestDispatcher dispat = request.getRequestDispatcher("produit/inventaire.jsp");
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
            if (request.getParameter("rechercher") != null) {
                if (request.getParameter("produit").length() == 0) {
                    response.sendRedirect("Inventaire");
                }
                Produit produit = new Produit();
                produit.setIntitule(request.getParameter("produit"));
                List<modele.Inventaire> inventaires = modele.Inventaire.rechercher(produit);
                request.setAttribute("inventaires", inventaires);
                RequestDispatcher dispat = request.getRequestDispatcher("produit/inventaire.jsp");
                dispat.forward(request, response);
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
