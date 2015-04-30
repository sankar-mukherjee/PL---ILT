/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package form;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
/**
 *
 * @author Sankar
 */
public class fetch implements
java.io.Serializable {

        private Vector portfolio = new Vector();

   public fetch() {
        Connection connection = null;
        // declare object of Statement interface that uses for executing sql statements.
        PreparedStatement pstatement = null;
        ResultSet rs = null;
        try {

            String connectionURL = "jdbc:mysql://localhost:3306/ide";
            // declare a connection by using Connection interface
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            /* Create a connection by using getConnection() method that takes
            parameters of string type connection url, user name and password to connect
            to database. */
            connection = DriverManager.getConnection(connectionURL, "root", "root");
            // sql query to insert values in the secified table.
            String res = "SELECT * FROM bangla ORDER BY ID DESC LIMIT 1";
            pstatement = connection.prepareStatement(res);
            rs = pstatement.executeQuery();
            //create the root element
            while (rs.next()) {
                //Add the attribute to the child
             portfolio.addElement(new GenerateXml(rs.getString(2), rs.getString(5), rs.getString(3), rs.getString(4)));
            }
            rs.close();
            pstatement.close();
            connection.close();

        } catch (Exception ex) {
            System.out.println("Unable to connect to Database." + ex.getMessage());
        }

      
   }

   public Iterator getPortfolio() {
      return portfolio.iterator();
   }

}


