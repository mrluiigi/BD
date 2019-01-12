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
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author Barbosa
 */
public class ClienteDAO{
    
    public static ArrayList<Document> getAll (Connection con) {        
        ArrayList<Document> r = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Cliente");
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int nif = Integer.parseInt(rs.getString("NIF"));
                String nome = rs.getString("Nome");
                String tipo = rs.getString("Tipo");
                int contacto = Integer.parseInt(rs.getString("Contacto"));
                
                PreparedStatement pes = con.prepareStatement("SELECT * FROM Encomenda AS E WHERE E.Cliente = " + nif + ";");
                ResultSet es = pes.executeQuery();
                
                ArrayList<Encomenda> encomendas;
                while(es.next()){
                    int id = Integer.parseInt(es.getString("ID"));
                    float valor = Float.parseFloat(es.getString("Valor"));
                    LocalDate data = LocalDate.parse(es.getString("Data"));

                    //Encomenda e = new Encomenda()
                }
                
               // Cliente c = new Cliente(nif, nome, tipo, contacto);
                
                
                
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return r;
    }
}
