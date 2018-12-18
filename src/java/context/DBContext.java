/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import entity.Field;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Jisoo
 */
public class DBContext {

    private final String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private final String serverName = "localhost";
    private final String dbName = "SaBoDa";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123456";
    String imgFolder;

    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        Class.forName(driver);
        return DriverManager.getConnection(url, userID, password);
    }
    
    
    
}

