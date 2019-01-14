package Migracao;




import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class Main {
    static Connection con;
    

    public static void writeJSON(List<Documento> l, MongoCollection<org.bson.Document> collection) {
        try {
            collection.drop();
            for( Documento d : l) {
              collection.insertOne(d.toDocument());;
            }
        } catch (Exception e) {
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
        
       /* writeJSON(ProdutoAnimalDAO.getAll(con),"ProdutoAnimal.json");
        writeJSON(ProdutoVegetalDAO.getAll(con),"ProdutoVegetal.json");
        writeJSON(ClienteDAO.getAll(con),"Cliente.json");
        writeJSON(RecursoDAO.getAll(con),"Recurso.json");
        writeJSON(AnimalDAO.getAll(con),"Animal.json");   
        writeJSON(PlantacaoDAO.getAll(con),"Plantacao.json");  
        writeJSON(EncomendaDAO.getAll(con),"Encomenda.json");  
        writeJSON(FuncionarioDAO.getAll(con),"Funcionario.json");*/
        
        
        MongoClient mongoClient = MongoClients.create();
        MongoDatabase database = mongoClient.getDatabase("quinta");
        
        MongoCollection<org.bson.Document> colAnimais = database.getCollection​("Animais");
        writeJSON(AnimalDAO.getAll(con),colAnimais);
        
        MongoCollection<org.bson.Document> colClientes = database.getCollection​("Clientes");
        writeJSON(ClienteDAO.getAll(con),colClientes);
        
        MongoCollection<org.bson.Document> colEncomendas = database.getCollection​("Encomendas");
        writeJSON(EncomendaDAO.getAll(con),colEncomendas);
        
        MongoCollection<org.bson.Document> colFuncionarios = database.getCollection​("Funcionarios");
        writeJSON(FuncionarioDAO.getAll(con),colFuncionarios);
        
        MongoCollection<org.bson.Document> colPlantacoes = database.getCollection​("Plantacoes");
        writeJSON(PlantacaoDAO.getAll(con),colPlantacoes);
        
        MongoCollection<org.bson.Document> colRecursos = database.getCollection​("Recursos");
        writeJSON(RecursoDAO.getAll(con),colRecursos);
        
        MongoCollection<org.bson.Document> colProdutosAnimais = database.getCollection​("ProdutosAnimais");
        writeJSON(ProdutoAnimalDAO.getAll(con),colProdutosAnimais);
        
        MongoCollection<org.bson.Document> colProdutosVegetais = database.getCollection​("ProdutosVegetais");
        writeJSON(ProdutoVegetalDAO.getAll(con),colProdutosVegetais);
    }
    
}
