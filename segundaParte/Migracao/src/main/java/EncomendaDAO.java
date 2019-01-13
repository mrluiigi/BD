

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Luís Correia
 */
public class EncomendaDAO {
    
    public static ArrayList<Documento> getAll (Connection con) {        
        ArrayList<Documento> r = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Encomenda AS E;");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int id = Integer.parseInt(rs.getString("ID"));
                float valor = Float.parseFloat(rs.getString("Valor"));
                String data = rs.getString("Data");
                int cliente = Integer.parseInt(rs.getString("Cliente"));
                
                PreparedStatement psA = con.prepareStatement("SELECT PAE.ProdutoAnimal_ID FROM ProdutoAnimalEncomenda AS PAE WHERE PAE.Encomenda_ID = " + id + ";");
                                                        
                ResultSet rsA = psA.executeQuery();
                List<Integer> produtosA = new ArrayList<>();
                while(rsA.next()){
                    int idA = Integer.parseInt(rsA.getString("ProdutoAnimal_ID"));
                    produtosA.add(idA);
                }
                
                PreparedStatement psV = con.prepareStatement("SELECT PAE.ProdutoVegetal_ID FROM ProdutoVegetalEncomenda AS PAE WHERE PAE.Encomenda_ID = " + id + ";");
                ResultSet rsV = psV.executeQuery();
                
                List<Integer> produtosV = new ArrayList<>();
                while(rsV.next()){
                    int idV = Integer.parseInt(rsV.getString("ProdutoVegetal_ID"));
                    produtosV.add(idV);
                }
                
                Encomenda e = new Encomenda(id, valor, data, produtosA, produtosV, cliente);
                r.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }
}
