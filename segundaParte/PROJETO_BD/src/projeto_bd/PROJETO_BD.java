/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Barbosa
 */
public class PROJETO_BD {

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
        Connection con = DriverManager.getConnection(connection, user, password);
        //ProdutosAnimais
        try {
            FileWriter file = new FileWriter("../ProdutoAnimal.json");
            for( Document d : ProdutoAnimalDAO.getAll(con)) {
                file.write(d.toJSONObject().toJSONString());
                file.flush();
        }

        } catch (IOException e) {
            e.printStackTrace();
        }
        
        
        //Clientes
        try {
            FileWriter file = new FileWriter("../Cliente.json");
            for( Document d : ClienteDAO.getAll(con)) {
                file.write(d.toJSONObject().toJSONString());
                file.flush();
        }

        } catch (IOException e) {
            e.printStackTrace();
        }
        
        
    }
    
}
