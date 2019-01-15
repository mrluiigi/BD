package Migracao;



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
public class EncomendaDAO {
    
    public static ArrayList<Documento> getAll (Connection con) {        
        ArrayList<Documento> r = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Encomenda AS E;");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int id = Integer.parseInt(rs.getString("ID"));
                float valor = Float.parseFloat(rs.getString("Valor"));
                LocalDate data = LocalDate.parse(rs.getString("Data"));
                int cliente = Integer.parseInt(rs.getString("Cliente"));
                
                PreparedStatement psA = con.prepareStatement("SELECT * FROM ProdutoAnimalEncomenda AS PAE WHERE PAE.Encomenda_ID = " + id + ";");
                                                        
                ResultSet rsA = psA.executeQuery();
                List<ProdutoEncomenda> produtosA = new ArrayList<>();
                while(rsA.next()){
                    int idA = Integer.parseInt(rsA.getString("ProdutoAnimal_ID"));
                    int quantidade = Integer.parseInt(rsA.getString("Quantidade"));
                    produtosA.add(new ProdutoEncomenda(idA, quantidade));
                }
                
                PreparedStatement psV = con.prepareStatement("SELECT * FROM ProdutoVegetalEncomenda AS PAE WHERE PAE.Encomenda_ID = " + id + ";");
                ResultSet rsV = psV.executeQuery();
                
                List<ProdutoEncomenda> produtosV = new ArrayList<>();
                while(rsV.next()){
                    int idV = Integer.parseInt(rsV.getString("ProdutoVegetal_ID"));
                    int quantidade = Integer.parseInt(rsV.getString("Quantidade"));
                    produtosV.add(new ProdutoEncomenda(idV, quantidade));
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
