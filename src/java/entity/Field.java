/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import context.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author qwert
 */
public class Field implements Serializable {

    public int id;
    public String desc;
    public double price;

    public static Field getFieldInfo(String id) {
        String query = "select * from field where id = " + id;
        System.out.println(query);
        try (Connection con = new DBContext().getConnection()) {
            ResultSet rs = con.prepareStatement(query).executeQuery();

            if (rs.next()) {
                Field field = new Field();
                field.id = rs.getInt("id");
                field.desc = rs.getString("desc");
                field.price = rs.getFloat("price");
                return field;
            } else {
                throw new Exception("Nodata");
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    

    public int getId() {
        return id;
    }

    public String getDesc() {
        return desc;
    }

    public double getPrice() {
        return price;
    }
    
    
}
