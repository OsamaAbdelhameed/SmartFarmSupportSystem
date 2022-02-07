/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Farm;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.LinkedList;

/**
 *
 * @author OSAMA
 */
public class Consumed {

    String item, type;
    int consumedQuantities;
    double price, totalPrice;

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getConsumedQuantities() {
        return consumedQuantities;
    }

    public void setConsumedQuantities(int consumedQuantities) {
        this.consumedQuantities = consumedQuantities;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Consumed(String item, String type, int consumedQuantities, double totalPrice) {
        this.item = item;
        this.type = type;
        this.consumedQuantities = consumedQuantities;
        this.totalPrice = totalPrice;
        this.price = totalPrice / consumedQuantities;
    }

    public Consumed() {
    }

    public LinkedList<Consumed> uniqueInfo(String user) throws SQLException {
        LinkedList<Consumed> items = new LinkedList<Consumed>();
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        String str = "SELECT * FROM Request WHERE supName='" + user + "'";
        ResultSet rs = st.executeQuery(str);
        String iName;
        int quan;
        double pri;
        boolean isFound = false;
        while(rs.next()){
            iName = rs.getString("cname");
            quan = rs.getInt("quantity");
            pri = rs.getDouble("totalPrice");
            items.add(new Consumed(iName, rs.getString("type"), quan, pri));
        }
        LinkedList<Consumed> unique = new LinkedList<Consumed>();
        for(int i =0; i<items.size(); i++){
            for(int j =i; j<items.size(); j++){
                if(items.get(i).getItem().equals(items.get(j).getItem()) && !items.get(i).equals(items.get(j))){
                    items.get(i).setConsumedQuantities(items.get(i).getConsumedQuantities()+items.get(j).getConsumedQuantities());
                    items.get(i).setTotalPrice(items.get(i).getTotalPrice()+items.get(j).getTotalPrice());
                    
                    unique.add(items.get(j));
                }
            }
        }
        for(Consumed i : unique){
            items.remove(i);
        }
        return items;
    }
    
    public LinkedList<Consumed> uniqueTodayInfo(String user) throws SQLException, ParseException {
        LinkedList<Consumed> items = new LinkedList<Consumed>();
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        String str = "SELECT * FROM Request WHERE supName='" + user + "'";
        ResultSet rs = st.executeQuery(str);
        String tim="";
        String iName;
        int quan;
        double pri;
        boolean isFound = false;
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -1);
        Date yes = cal.getTime();
        while(rs.next()){
            iName = rs.getString("cname");
            quan = rs.getInt("quantity");
            pri = rs.getDouble("totalPrice");
            tim = rs.getString("time");
            if((new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy").parse(tim)).after(yes)){
                items.add(new Consumed(iName, rs.getString("type"), quan, pri));
            }
        }
        LinkedList<Consumed> unique = new LinkedList<Consumed>();
        for(int i =0; i<items.size(); i++){
            for(int j =i; j<items.size(); j++){
                if(items.get(i).getItem().equals(items.get(j).getItem()) && !items.get(i).equals(items.get(j))){
                    items.get(i).setConsumedQuantities(items.get(i).getConsumedQuantities()+items.get(j).getConsumedQuantities());
                    items.get(i).setTotalPrice(items.get(i).getTotalPrice()+items.get(j).getTotalPrice());
                    
                    unique.add(items.get(j));
                }
            }
        }
        for(Consumed i : unique){
            items.remove(i);
        }
        return items;
    }
    
    public LinkedList<Consumed> uniqueYesterdayInfo(String user) throws SQLException, ParseException {
        LinkedList<Consumed> items = new LinkedList<Consumed>();
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        String str = "SELECT * FROM Request WHERE supName='" + user + "'";
        ResultSet rs = st.executeQuery(str);
        String tim="";
        String iName;
        int quan;
        double pri;
        boolean isFound = false;
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -2);
        Date yes = cal.getTime();
        while(rs.next()){
            iName = rs.getString("cname");
            quan = rs.getInt("quantity");
            pri = rs.getDouble("totalPrice");
            tim = rs.getString("time");
            if((new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy").parse(tim)).after(yes)){
                items.add(new Consumed(iName, rs.getString("type"), quan, pri));
            }
        }
        LinkedList<Consumed> unique = new LinkedList<Consumed>();
        for(int i =0; i<items.size(); i++){
            for(int j =i; j<items.size(); j++){
                if(items.get(i).getItem().equals(items.get(j).getItem()) && !items.get(i).equals(items.get(j))){
                    items.get(i).setConsumedQuantities(items.get(i).getConsumedQuantities()+items.get(j).getConsumedQuantities());
                    items.get(i).setTotalPrice(items.get(i).getTotalPrice()+items.get(j).getTotalPrice());
                    
                    unique.add(items.get(j));
                }
            }
        }
        for(Consumed i : unique){
            items.remove(i);
        }
        return items;
    }
    
    public LinkedList<Consumed> uniqueLastInfo(String user) throws SQLException, ParseException {
        LinkedList<Consumed> items = new LinkedList<Consumed>();
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        String str = "SELECT * FROM Request WHERE supName='" + user + "'";
        ResultSet rs = st.executeQuery(str);
        String tim="";
        String iName;
        int quan;
        double pri;
        boolean isFound = false;
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -7);
        Date yes = cal.getTime();
        while(rs.next()){
            iName = rs.getString("cname");
            quan = rs.getInt("quantity");
            pri = rs.getDouble("totalPrice");
            tim = rs.getString("time");
            if((new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy").parse(tim)).after(yes)){
                items.add(new Consumed(iName, rs.getString("type"), quan, pri));
            }
        }
        LinkedList<Consumed> unique = new LinkedList<Consumed>();
        for(int i =0; i<items.size(); i++){
            for(int j =i; j<items.size(); j++){
                if(items.get(i).getItem().equals(items.get(j).getItem()) && !items.get(i).equals(items.get(j))){
                    items.get(i).setConsumedQuantities(items.get(i).getConsumedQuantities()+items.get(j).getConsumedQuantities());
                    items.get(i).setTotalPrice(items.get(i).getTotalPrice()+items.get(j).getTotalPrice());
                    
                    unique.add(items.get(j));
                }
            }
        }
        for(Consumed i : unique){
            items.remove(i);
        }
        return items;
    }
}
