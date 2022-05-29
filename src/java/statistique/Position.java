/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package statistique;


import com.google.gson.Gson;
import java.util.List;


/**
 *
 * @author P3B-1222
 */
public class Position {
    int y;
    String label;
    String name;

    public Position() {
    }

    public Position(int y, String label) {
        this.y = y;
        this.label = label;
    }

    
    
    public Position(int y, String label,String name) {
        this.y = y;
        this.label = label;
        this.name=name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
    
    public String convertJson(List<Position> list)
    {
        String json=new Gson().toJson(list);
        return json;
    }
}
