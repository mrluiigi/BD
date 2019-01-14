package Migracao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Barbosa
 */
public class ClienteDAO{
    
    public static ArrayList<Documento> getAll (Connection con) {        
        ArrayList<Documento> r = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Cliente");
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int nif = Integer.parseInt(rs.getString("NIF"));
                String nome = rs.getString("Nome");
                String tipo = rs.getString("Tipo");
                int contacto = Integer.parseInt(rs.getString("Contacto"));
                
                PreparedStatement pes = con.prepareStatement("SELECT E.ID FROM Encomenda AS E WHERE E.Cliente = " + nif + ";");
                ResultSet es = pes.executeQuery();
                
                List<Integer> encomendas = new ArrayList<>();
                while(es.next()){
                    int id = Integer.parseInt(es.getString("ID"));

                    encomendas.add(id);
                }
                
               Cliente c = new Cliente(nif, nome, tipo, contacto, encomendas);
               r.add(c);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return r;
    }
}
