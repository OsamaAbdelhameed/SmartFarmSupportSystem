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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

/**
 *
 * @author OSAMA
 */
public class EquipmentDB implements Serializable {

    String name, image, desc, enable;
    int range;
    double price;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getRange() {
        return range;
    }

    public void setRange(int range) {
        this.range = range;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public EquipmentDB(String name, String image, String desc, String enable, int range, double price) {
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.enable = enable;
        this.range = range;
        this.price = price;
    }
    
    public EquipmentDB() {
    }
    
    public void addEquip() throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="INSERT INTO Equipment (name, equipRange, image, price, describ, enabled) VALUES (?,?,?,?,?,?)";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setString(1,name);
	st.setInt(2, range);
	st.setString(3, image);
	st.setDouble(4, price);
	st.setString(5, desc);
	st.setString(6, enable);
	st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public LinkedList showNames() throws SQLException {
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM Equipment");
        LinkedList<String> names = new LinkedList<>();
        
        while (rs.next()){
            names.add(rs.getString("name"));
        }
        
        st.close();
        con.close();
        return names;
    }
    
    public void deleteEquip(String equipName) throws SQLException{
        Connection conn = DBConnect.getConn();
        String sql = "DELETE FROM Equipment WHERE name = ?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, equipName);
        st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public void editEquip(String equipName) throws SQLException{
        Connection conn = DBConnect.getConn();
        String sql = "UPDATE equipment SET equipRange=?, image=?, price=?, enabled=?, describ=? WHERE name=?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setInt(1, range);
        st.setString(2, image);
        st.setDouble(3, price);
        st.setString(4, enable);
        st.setString(5, desc);
        st.setString(6, name);
        st.executeUpdate();
        st.close();
        conn.close();
    }
}
