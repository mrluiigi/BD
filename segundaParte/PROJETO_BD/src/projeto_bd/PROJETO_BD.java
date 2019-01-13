package projeto_bd;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class PROJETO_BD {
    static Connection con;

    public static void writeJSON(List<Document> l, String file) {
        try {
            FileWriter filePA = new FileWriter("../" + file);
            for( Document d : l) {
                filePA.write(d.toJSONObject().toJSONString());
                filePA.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        //Establish the connection 
        String connection = "jdbc:mysql://localhost:3306/quinta?useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String user = "gestor";
        String password = "manel42";
        con = DriverManager.getConnection(connection, user, password);
        writeJSON(ProdutoAnimalDAO.getAll(con),"ProdutoAnimal.json");
        writeJSON(ProdutoVegetalDAO.getAll(con),"ProdutoVegetal.json");
        writeJSON(ClienteDAO.getAll(con),"Cliente.json");
        writeJSON(RecursoDAO.getAll(con),"Recurso.json");
        writeJSON(AnimalDAO.getAll(con),"Animal.json");   
        writeJSON(PlantacaoDAO.getAll(con),"Plantacao.json");  
        writeJSON(EncomendaDAO.getAll(con),"Encomenda.json");  
        writeJSON(FuncionarioDAO.getAll(con),"Funcionario.json");  
    }
    
}
