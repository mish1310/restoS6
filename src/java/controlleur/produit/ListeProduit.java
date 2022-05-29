/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.produit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.Categorie;
import modele.Produit;
import modele.Profil;

/**
 *
 * @author User
 */
public class ListeProduit extends HttpServlet {

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
            Boolean authentification = Profil.authentifier(1, request);
            if(!authentification){
                response.sendRedirect("PageFormulaireLogin");
            }
            
            List<Categorie> categories = new Categorie().selectAll();
            request.setAttribute("categories", categories);

            if (request.getParameter("categorie") == null) {
                List<Produit> listeProduit = new Produit().selectAllVendable();
                request.setAttribute("listeProduit", listeProduit);

                RequestDispatcher dispat = request.getRequestDispatcher("produit/listeProduit.jsp");
                dispat.forward(request, response);
            } else if (Integer.valueOf(request.getParameter("categorie")) == 0){
                List<Produit> listeProduit = new Produit().selectAllVendable();
                request.setAttribute("listeProduit", listeProduit);

                RequestDispatcher dispat = request.getRequestDispatcher("produit/listeProduit.jsp");
                dispat.forward(request, response);
            } else {
                List<Produit> listeProduit = new Produit().selectAllByCategorie(Integer.valueOf(request.getParameter("categorie")));
                request.setAttribute("listeProduit", listeProduit);

                RequestDispatcher dispat = request.getRequestDispatcher("produit/listeProduit.jsp");
                dispat.forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
