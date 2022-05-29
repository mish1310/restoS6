/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author Manda
 */
public class Paiement {
    
    private int idPayement;
    private Commande commande;
    private TypePaiement typePaiement;
    private double montant;
    private Date datePaiement;
    
    public void insert() throws Exception  {
        Connection con = DBConnection.getConnection();
        try{
            Statement stmt = con.createStatement();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String requete = "INSERT INTO paiement(idCommande, idTypePaiement, montant, datePaiement) VALUES ("+this.commande.getIdCommande()+","
                    + this.typePaiement.getIdTypePayement() +", "+ this.montant +", '"+ dateFormat.format(this.datePaiement) +"' )";
            Boolean rs =  stmt.execute(requete);
            con.close();
        }
        catch(Exception ex){
            if(con != null) con.close();
            throw ex;
        }
    }
    
    public HashMap<String, Double> getTotalPayement(String date1, String date2) throws Exception {
        HashMap<String, Double> retour = new HashMap<String, Double>();
        Connection con = DBConnection.getConnection();
        try {
            Statement stmt = con.createStatement();
            String requete = "SELECT SUM(montant) as sommePaiement, tp.mode FROM paiement p JOIN typePaiement tp ON p.idTypePaiement=tp.idTypePaiement WHERE datePaiement < '"+date2+"' AND datePaiement > '"+date1+"'  GROUP BY p.idTypePaiement, tp.mode";
            ResultSet res = stmt.executeQuery(requete);
            while(res.next()){
                retour.put(res.getString("mode"), res.getDouble("sommePaiement"));
            }
            con.close();
        } catch(Exception ex) {
            con.close();
            throw ex;
        }
        return retour;
    }

    public int getIdPayement() {
        return idPayement;
    }

    public void setIdPayement(int idPayement) {
        this.idPayement = idPayement;
    }

    public Commande getCommande() {
        return commande;
    }

    public void setCommande(Commande commande) {
        this.commande = commande;
    }

    public TypePaiement getTypePaiement() {
        return typePaiement;
    }

    public void setTypePayement(TypePaiement typePaiement) {
        this.typePaiement = typePaiement;
    }

    public double getMontant() {
        return montant;
    }

    public void setMontant(double montant) {
        this.montant = montant;
    }

    public Date getDatePaiement() {
        return datePaiement;
    }

    public void setDatePayement(Date datePaiement) {
        this.datePaiement = datePaiement;
    }
    
}
