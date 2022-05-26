/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlleur.serveur;

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
import modele.DBConnection;
import modele.Serveur;

/**
 *
 * @author User
 */
public class VoirPouboire extends HttpServlet {

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
        try {
            List<Serveur> listeServeur = new Serveur().selectAll();

            int idServeur = Integer.valueOf(request.getParameter("categorie"));
            String date1 = request.getParameter("date1");
            String date2 = request.getParameter("date2");
            Serveur s = new Serveur(idServeur);
            float pourBoire = s.getPourBoireServeur(DBConnection.getConnection(), date1, date2);
            System.out.println(pourBoire);
            //s.setIdServeur(Integer.valueOf(request.getParameter("idServeur")));
            //Date dateDebut = new SimpleDateFormat("yyyy/mm/dd").parse(request.getParameter("dateDebut"));
            //Date dateFin = new SimpleDateFormat("yyyy/mm/dd").parse(request.getParameter("dateFin"));
            //double pourboire = s.getSommePouboire(dateDebut, dateFin);
            //request.setAttribute("pourboire", pourboire);
            request.setAttribute("listeServeur", listeServeur);
            request.setAttribute("pourBoire", pourBoire);
            request.setAttribute("verif", 1);
            RequestDispatcher dispat = request.getRequestDispatcher("pourBoire.jsp");
            dispat.forward(request, response);
        } catch (Exception ex) {

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
