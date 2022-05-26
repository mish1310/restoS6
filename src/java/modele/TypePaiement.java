/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

/**
 *
 * @author Manda
 */
public class TypePaiement {
    
    private int idTypePayement;

    public TypePaiement(int idTypePayement, String nomTypePayement) {
        this.idTypePayement = idTypePayement;
        this.nomTypePayement = nomTypePayement;
    }
    private String nomTypePayement;

    public int getIdTypePayement() {
        return idTypePayement;
    }

    public void setIdTypePayement(int idTypePayement) {
        this.idTypePayement = idTypePayement;
    }

    public String getNomTypePayement() {
        return nomTypePayement;
    }

    public void setNomTypePayement(String nomTypePayement) {
        this.nomTypePayement = nomTypePayement;
    }
    
}
