/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Barbosa
 */
public class ClienteDAO {
    public static ArrayList<Document> getAll () {
        Connection con = null;
        ArrayList<Document> r = new ArrayList<>();

        try {
            con = Connect.connect();
            PreparedStatement ps = con.prepareStatement("SELECT P.AreaPlantada_m2 AS Area, P.DataInicio AS DataI, P.DataFim AS DataF, L.Designio AS Lote, Q.Nome AS Quinta, Prod.Nome AS Produto, P.Despesa_euros AS Desp\n" +
                                                        "FROM Plantacoes as P\n" +
                                                        "JOIN Lotes AS L\n" +
                                                        "ON L.ID = P.Lotes_ID\n" +
                                                        "JOIN Quintas AS Q\n" +
                                                        "ON Q.ID = L.Quintas_ID\n" +
                                                        "JOIN Produtos AS Prod\n" +
                                                        "ON Prod.ID = P.Produto_ID\n" +
                                                        "ORDER BY P.DataInicio DESC");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Plantacao p = new Plantacao();
                PlantacaoComDataFim pn = null;
                
                if (rs.getDate("DataF") != null) {
                    pn = new PlantacaoComDataFim(p);
                    pn.DataFim = "ISODate(\"" + rs.getDate("DataF") + "T00:00:00Z\")";
                }

                if(pn == null) {
                    r.add(p);
                } else {
                    r.add(pn);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
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
