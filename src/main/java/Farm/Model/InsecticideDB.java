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
public class InsecticideDB implements Serializable{

    String name, image, desc, insect, enable;
    int range;
    double price;
    
    public InsecticideDB() {
    }


    public InsecticideDB(String name, String insect, String image, String desc, int range, String enable, double price) {
        this.name = name;
        this.insect = insect;
        this.image = image;
        this.desc = desc;
        this.range = range;
        this.enable = enable;
        this.price = price;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

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

    public String getInsect() {
        return insect;
    }

    public void setInsect(String insect) {
        this.insect = insect;
    }

    public void addInsect() throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="INSERT INTO Insecticide (name, insecRange, insect, image, enabled, price, describ) VALUES (?,?,?,?,?,?,?)";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setString(1,name);
	st.setInt(2, range);
	st.setString(3, insect);
	st.setString(4, image);
	st.setString(5, enable);
	st.setDouble(6, price);
	st.setString(7, desc);
	st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public LinkedList showNames() throws SQLException {
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM Insecticide");
        LinkedList<String> names = new LinkedList<>();
        
        while (rs.next()){
            names.add(rs.getString("name"));
        }
        
        st.close();
        con.close();
        return names;
    }
    
    public void deleteInsect(String insecName) throws SQLException{
        Connection conn = DBConnect.getConn();
        String sql = "DELETE FROM Insecticide WHERE name = ?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, insecName);
        st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public void editInsect(String insecName) throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="UPDATE insecticide SET insecRange=?, insect=?, image=?, price=?, enabled=?, describ=? WHERE name=?";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setInt(1, range);
	st.setString(2, insect);
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
