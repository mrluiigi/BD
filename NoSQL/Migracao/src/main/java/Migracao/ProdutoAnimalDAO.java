package Migracao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class ProdutoAnimalDAO {
    
    public static ArrayList<Documento> getAll (Connection con) {        
        ArrayList<Documento> r = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM ProdutoAnimal AS PA" +
                                                        ";");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int id = Integer.parseInt(rs.getString("ID"));
                String designacao = rs.getString("Designacao");
                float preco = Float.parseFloat(rs.getString("Preco"));
                int stock = Integer.parseInt(rs.getString("Stock"));
                String val = rs.getString("Validade");
                LocalDate validade = null;
                if(val != null) {
                    validade = LocalDate.parse(val);
                }
                int origemID = Integer.parseInt(rs.getString("Animal_ID"));               
                Produto e = new Produto(id, designacao, preco, stock, validade, origemID);
                r.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }
    
}
