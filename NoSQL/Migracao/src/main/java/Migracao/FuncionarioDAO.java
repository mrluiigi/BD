package Migracao;



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
public class FuncionarioDAO {
    
    public static ArrayList<Documento> getAll (Connection con) { 
        ArrayList<Documento> res = new ArrayList<>();
        
        try{
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Funcionário;");
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                int numero = Integer.parseInt(rs.getString("Número"));
                String nome = rs.getString("Nome");
                String tipo = rs.getString("Tipo");
                float salario = Float.parseFloat(rs.getString("Salário"));
                String contacto = rs.getString("Contacto");
                String horario = rs.getString("Horário");
                
                PreparedStatement psA = con.prepareStatement("SELECT FA.Animal_ID FROM FuncionárioAnimal AS FA WHERE FA.Funcionário_Número = " + numero + ";");
                ResultSet rsA = psA.executeQuery();
                
                List<Integer> animais = new ArrayList<>();
                while(rsA.next()){
                    int idA = Integer.parseInt(rsA.getString("Animal_ID"));
                    animais.add(idA);
                }
                
                PreparedStatement psP = con.prepareStatement("SELECT FA.Plantação_ID FROM FuncionárioPlantação AS FA WHERE FA.Funcionário_Número = " + numero + ";");
                ResultSet rsP = psP.executeQuery();
                
                List<Integer> plantacoes = new ArrayList<>();
                while(rsP.next()){
                    int idP = Integer.parseInt(rsP.getString("Plantação_ID"));
                    plantacoes.add(idP);
                }

                Funcionario f = new Funcionario(numero, nome, tipo, salario, contacto, horario, animais, plantacoes);
                
                res.add(f);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }
    
}
