/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Farm.Model;

import Farm.DBConnect;
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
public class FertilizerDB {

    String name, plantType, image, desc, enable;
    int range;
    double price;

    public FertilizerDB(String name, String plantType, String image, String desc, String enable, int range, double price) {
        this.name = name;
        this.plantType = plantType;
        this.image = image;
        this.desc = desc;
        this.range = range;
        this.enable = enable;
        this.price = price;
    }
    
    public FertilizerDB() {
    }

    public String getName() {
        return name;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
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

    public String getPlantType() {
        return plantType;
    }

    public void setPlantType(String plantType) {
        this.plantType = plantType;
    }
    
    public void addFertilizer() throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="INSERT INTO Fertilizer (name, fertRange, plantType, image, price, enabled, describ) VALUES (?,?,?,?,?,?,?)";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setString(1,name);
	st.setInt(2, range);
	st.setString(3, plantType);
	st.setString(4, image);
	st.setDouble(5, price);
	st.setString(6, enable);
	st.setString(7, desc);
	st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public LinkedList showNames() throws SQLException {
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM Fertilizer");
        LinkedList<String> names = new LinkedList<>();
        
        while (rs.next()){
            names.add(rs.getString("name"));
        }
        
        st.close();
        con.close();
        return names;
    }
    
    public void deleteFertilizer(String fertName) throws SQLException{
        Connection conn = DBConnect.getConn();
        String sql = "DELETE FROM Fertilizer WHERE name = ?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, fertName);
        st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public void editFertilizer(String fertName) throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="UPDATE fertilizer SET fertRange=?, plantType=?, image=?, price=?, enabled=?, describ=? WHERE name=?";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setInt(1, range);
	st.setString(2, plantType);
	st.setString(3, image);
	st.setDouble(4, price);
	st.setString(5, enable);
	st.setString(6, desc);
	st.setString(7,name);
	st.executeUpdate();
        st.close();
        conn.close();
    }
}
