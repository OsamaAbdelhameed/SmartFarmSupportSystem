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
public class CropDB {

    String name, startMonth, endMonth, season, image, desc, enable;
    double price;

    public CropDB() {
    }

    public CropDB(String name, String startMonth, String endMonth, String season, String image, String desc, String enable, double price) {
        this.name = name;
        this.startMonth = startMonth;
        this.endMonth = endMonth;
        this.season = season;
        this.image = image;
        this.desc = desc;
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

    public String getStartMonth() {
        return startMonth;
    }

    public void setStartMonth(String startMonth) {
        this.startMonth = startMonth;
    }

    public String getEndMonth() {
        return endMonth;
    }

    public void setEndMonth(String endMonth) {
        this.endMonth = endMonth;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void addCrop() throws SQLException {
        Connection conn = DBConnect.getConn();
        String sql = "INSERT INTO Crop (name, startMonth, endMonth, season, image, price, describ, enabled) VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, name);
        st.setString(2, startMonth);
        st.setString(3, endMonth);
        st.setString(4, season);
        st.setString(5, image);
        st.setDouble(6, price);
        st.setString(7, desc);
        st.setString(8, enable);
        st.executeUpdate();
        st.close();
        conn.close();
    }

    public LinkedList showNames() throws SQLException {
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM Crop");
        LinkedList<String> names = new LinkedList<>();
        
        while (rs.next())
                {
                  names.add(rs.getString("name"));
                }
        
        st.close();
        con.close();
        return names;
    }
    
    public void deleteCrop(String cropName) throws SQLException{
        Connection conn = DBConnect.getConn();
        String sql = "DELETE FROM crop WHERE name = ?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, cropName);
        st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public void editCrop(String cropName) throws SQLException{
        Connection conn = DBConnect.getConn();
        String sql = "UPDATE crop SET startMonth=?, endMonth=?, season=?, image=?, price=?, enabled=?,describ=? WHERE name=?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, startMonth);
        st.setString(2, endMonth);
        st.setString(3, season);
        st.setString(4, image);
        st.setDouble(5, price);
        st.setString(6, enable);
        st.setString(7, desc);
        st.setString(8, name);
        st.executeUpdate();
        st.close();
        conn.close();
    }
}
