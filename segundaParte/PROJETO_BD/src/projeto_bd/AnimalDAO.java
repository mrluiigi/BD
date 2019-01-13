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
import java.util.List;

/**
 *
 * @author Luís Correia
 */
public class AnimalDAO {
    
    public static ArrayList<Document> getAll (Connection con) {        
        ArrayList<Document> res = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Animal");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int id = Integer.parseInt(rs.getString("ID"));
                String especie = rs.getString("Espécie");
                float peso = Float.parseFloat(rs.getString("Peso"));
                String dataN = rs.getString("DataNascimento");
                String validadeV = rs.getString("ValidadeVacina");
                String genero = rs.getString("Género");
                String vida = rs.getString("Vida");
                
                List<Consumo> consumo = new ArrayList<>();
                PreparedStatement psC = con.prepareStatement("SELECT AR.Recurso_ID, AR.QuantidadeConsumida, AR.DataUltimoConsumo FROM AnimalRecurso AS AR WHERE AR.Animal_ID =" + id +";");
                ResultSet rsC = psC.executeQuery();
                while(rsC.next()){
                    int recursoID = Integer.parseInt(rsC.getString("Recurso_ID"));
                    int quantidadeConsumida = Integer.parseInt(rsC.getString("QuantidadeConsumida"));
                    String dataUltimoConsumo = LocalDate.parse(rsC.getString("DataUltimoConsumo")).toString();
                    Consumo recursosConsumidos = new Consumo(recursoID, quantidadeConsumida, dataUltimoConsumo);
                    consumo.add(recursosConsumidos);
                }
                    
                Animal a = new Animal(id, especie, peso, dataN, validadeV, genero, vida, consumo);
                res.add(a);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
}
