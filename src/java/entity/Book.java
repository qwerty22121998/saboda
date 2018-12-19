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
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
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
    public int from;
    public int to;
    public String date;
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
                order.from = rs.getInt(6);
                order.to = rs.getInt(7);
                order.price = rs.getString(8);
                order.id = rs.getInt(9);
                order.date = rs.getString(10);
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
        String query = "insert into [order] (id,fieldId, [from], name, note, phone, price, [status], [to], date)\n"
                + "values (" + newID + ",?,?,N'" + name + "',?,?,?,?,?,?)";
        System.out.println(query);
        try (Connection conn = new DBContext().getConnection()) {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, fieldID);
            ps.setInt(2, from);
            ps.setString(3, note);
            ps.setString(4, phone);
            ps.setString(5, price);
            ps.setBoolean(6, status);
            ps.setInt(7, to);
            ps.setString(8, date);
            ps.executeUpdate();
            return newID;

        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public static Map<String, ArrayList<Integer>> getFreeHours(String id) {
        Map<String, ArrayList<Integer>> mp = new HashMap<>();

        String query = "select [date],[from],[to] from [order] where status=1 and fieldId =" + id;
        try (Connection conn = new DBContext().getConnection()) {
            ResultSet rs = conn.prepareStatement(query).executeQuery();
            while (rs.next()) {
                String d = rs.getString(1);
                int l = rs.getInt(2);
                int h = rs.getInt(3);
                System.out.println(d + " " + l + " " + h);
                ArrayList<Integer> arr = new ArrayList<>();
                if (mp.get(d) == null) {
                    mp.put(d, new ArrayList<>());
                }
                mp.get(d).add(l);
                mp.get(d).add(h);

            }
        } catch (Exception ex) {
            Logger.getLogger(Book.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return mp;
        }

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

    public int getFrom() {

        return from;
    }

    public int getTo() {
        return to;
    }

    public String getPrice() {
        return price;
    }

    public int getId() {
        return id;
    }

}
