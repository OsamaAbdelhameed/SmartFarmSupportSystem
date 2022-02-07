/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Farm.Model;

import Farm.DBConnect;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author OSAMA
 */
public class RequestDB implements Serializable{
    String time, farmer, type, neededItem, desc, status;
    int quantity;
    double totalPrice;
    
    public RequestDB() {
    }

    public RequestDB(String time, String farmer, String type, String neededItem, String desc, String status, int quantity, double totalPrice) {
        this.time = time;
        this.farmer = farmer;
        this.type = type;
        this.neededItem = neededItem;
        this.desc = desc;
        this.status = status;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getFarmer() {
        return farmer;
    }

    public void setFarmer(String farmer) {
        this.farmer = farmer;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNeededItem() {
        return neededItem;
    }

    public void setNeededItem(String neededItem) {
        this.neededItem = neededItem;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public void addRequest() throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="INSERT INTO Request (time, type, name, cname, describ, quantity, totalPrice, status) VALUES (?,?,?,?,?,?,?,?)";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setString(1,time);
	st.setString(2, type);
	st.setString(3, farmer);
	st.setString(4, neededItem);
	st.setString(5, desc);
	st.setInt(6, quantity);
	st.setDouble(7, totalPrice);
	st.setString(8, status);
	st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public void updateStatus(String time, String result) throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="UPDATE Request SET status=? WHERE time=?";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setString(1,result);
	st.setString(2, time);
	st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public void updateStatus(String time, String result, String supplier) throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="UPDATE Request SET supName=?, status=? WHERE time=?";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setString(1,supplier);
	st.setString(2,result);
	st.setString(3, time);
	st.executeUpdate();
        st.close();
        conn.close();
    }
    
//    public LinkedList< uniqueRequests()
}
