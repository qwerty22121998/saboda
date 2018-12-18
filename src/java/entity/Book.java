/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import context.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author qwert
 */
public class Book implements Serializable {

    public int fieldID;
    public String note;
    public String phone;
    public String name;
    public boolean status;
    public String from;
    public String to;
    public String price;
    public int id;

    public Book getOrder(String id) {
        String query = "select * from [order] where id = " + id;
        try (Connection conn = new DBContext().getConnection()) {
            ResultSet rs = conn.prepareStatement(query).executeQuery();
            if (rs.next()) {
                Book order = new Book();
                order.fieldID = rs.getInt(1);
                order.note = rs.getString(2);
                order.phone = rs.getString(3);
                order.name = rs.getNString(4);
                order.status = rs.getBoolean(5);
                order.from = rs.getString(6);
                order.to = rs.getString(7);
                order.price = rs.getString(8);
                order.id = rs.getInt(9);
                return order;
            }
            return null;
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public int Place() {
        int newID = new Random(new Date().getTime()).nextInt(9999) + 1;
        this.id = newID;
        String query = "insert into [order] (id,fieldId, [from], name, note, phone, price, [status], [to])\n"
                + "values (" + newID + ",?,?,N'" + name + "',?,?,?,?,?)";
        System.out.println(query);
        try (Connection conn = new DBContext().getConnection()) {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, fieldID);
            ps.setString(2, from);
//            ps.setNString(3, name);
            ps.setString(3, note);
            ps.setString(4, phone);
            ps.setString(5, price);
            ps.setBoolean(6, status);
            ps.setString(7, to);
            ps.executeUpdate();
            return newID;

        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public static void Pay(String id) {
        String query = "update [order] set status = 1 where id=" + id;
        System.out.println(query);
        try (Connection conn = new DBContext().getConnection()) {
            conn.prepareStatement(query).executeUpdate();
        } catch (Exception e) {
            
        }
    }

    public int getFieldID() {
        return fieldID;
    }

    public String getNote() {
        return note;
    }

    public String getPhone() {
        return phone;
    }

    public String getName() {
        return name;
    }

    public boolean isStatus() {
        return status;
    }


    public String getFrom() {

        return from;
    }

    public String getTo() {
        return to;
    }

    public String getPrice() {
        return price;
    }

    public int getId() {
        return id;
    }

}
