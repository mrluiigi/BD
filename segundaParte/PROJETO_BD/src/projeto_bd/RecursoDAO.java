/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *  private int id;
    private String tipo;
    private String fornecedor;
    private float preco;
    private int stock;
 */
/**
 *
 * @author Luís Correia
 */
public class RecursoDAO {
    
    public static ArrayList<Document> getAll (Connection con) {        
        ArrayList<Document> res = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Recurso");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int id = Integer.parseInt(rs.getString("ID"));
                String tipo = rs.getString("Tipo");
                String fornecedor = rs.getString("Fornecedor");
                float preco = Float.parseFloat(rs.getString("Preco"));
                int stock = Integer.parseInt(rs.getString("Stock"));
                
                
                Recurso r = new Recurso(id, tipo, fornecedor, preco, stock);
                res.add(r);
            }
            
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
}
