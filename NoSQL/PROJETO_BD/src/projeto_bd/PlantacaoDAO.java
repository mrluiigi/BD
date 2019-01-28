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
public class PlantacaoDAO {

        public static ArrayList<Document> getAll (Connection con) {        
        ArrayList<Document> r = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Plantação;");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int id = Integer.parseInt(rs.getString("ID"));
                String tipo = rs.getString("Tipo");
                float area = Float.parseFloat(rs.getString("Area"));
                int mesColheita = Integer.parseInt(rs.getString("MesColheita"));
                
                List<Consumo> consumo = new ArrayList<>();
                PreparedStatement psP = con.prepareStatement("SELECT PR.Recurso_ID, PR.QuantidadeConsumida, PR.DataUltimoConsumo FROM PlantaçãoRecurso AS PR WHERE PR.Plantação_ID =" + id + ";");
                ResultSet rsP = psP.executeQuery();
                while(rsP.next()){
                    int recursoID = Integer.parseInt(rsP.getString("Recurso_ID"));
                    int quantidadeConsumida = Integer.parseInt(rsP.getString("QuantidadeConsumida"));
                    String dataUltimoConsumo = LocalDate.parse(rsP.getString("DataUltimoConsumo")).toString();
                    Consumo recursosConsumidos = new Consumo(recursoID, quantidadeConsumida, dataUltimoConsumo);
                    consumo.add(recursosConsumidos);
                }
                
                Plantacao p = new Plantacao(id, tipo, area, mesColheita, consumo);
                r.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }
}
