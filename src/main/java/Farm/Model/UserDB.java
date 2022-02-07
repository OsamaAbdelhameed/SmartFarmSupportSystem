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
import java.util.Date;
import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author OSAMA
 */
public class UserDB implements Serializable {

    String name, username, password, mobile, city, state, address, email;
    int roleID;
    
    public UserDB() {
    }

    public UserDB(String name, String username, String password, String mobile, String city, String state, String address, String email, int roleID) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.mobile = mobile;
        this.city = city;
        this.state = state;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
    
    public static boolean isValidName(String s) 
	{
	    Pattern p = Pattern.compile("^[A-Za-z ]*$");    
	    Matcher m = p.matcher(s); 
	    return (m.find() && m.group().equals(s)); 
	}
    
    public void register() throws SQLException {
		// TODO Auto-generated method stub
	Connection conn=DBConnect.getConn();
	String sql="INSERT INTO User (name, userName, RoleID, Password, Mobile, city, state, address, email) VALUES (?,?,?,?,?,?,?,?,?)";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setString(1,name);
	st.setString(2, username);
	st.setInt(3, roleID);
	st.setString(4, password);
	st.setString(5, mobile);
	st.setString(6, city);
	st.setString(7, state);
	st.setString(8, address);
	st.setString(9, email);
	st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public String login() throws SQLException{
        Connection conn=DBConnect.getConn();
        String sql="SELECT * FROM User WHERE userName='"+username+"' AND Password='"+password+"'";
	PreparedStatement st=conn.prepareStatement(sql);
	ResultSet rs= st.executeQuery();
	while(rs.next()){
            String usernamedb=rs.getString("username");
            String passdb=rs.getString("password");
            int roledb=rs.getInt("roleid");
            if(username.equals(usernamedb) && password.equals(passdb) && roledb==1)
            	return "ADMIN_ROLE";
            	
            else if (username.equals(usernamedb) && password.equals(passdb) && roledb==2) 
                return "CUSTOMER_ROLE";
                
            else if (username.equals(usernamedb) && password.equals(passdb) && roledb==3) {
                return "SUPPLIER_ROLE";
            }
        }	
	return "INVALID";
    }
    
    public void logHistory(String user) throws SQLException{
        Connection conn=DBConnect.getConn();
        String sql="INSERT INTO logs (time, name) VALUES (?,?)";
        PreparedStatement  st=conn.prepareStatement(sql);
        Date today = new Date();
        st.setString(1,today.toString());
        st.setString(2, user);
        st.executeUpdate();
    }
    
    public void deleteUser(String userName) throws SQLException{
        Connection conn = DBConnect.getConn();
        String sql = "DELETE FROM User WHERE name = ?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, userName);
        st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public void Update(String userName) throws SQLException{
        Connection conn=DBConnect.getConn();
	String sql="UPDATE User SET name=?, RoleID=?, Password=?, Mobile=?, city=?, state=?, address=?, email=? WHERE userName=?";
	PreparedStatement st=conn.prepareStatement(sql);
	st.setString(1,name);
	st.setInt(2, roleID);
	st.setString(3, password);
	st.setString(4, mobile);
	st.setString(5, city);
	st.setString(6, state);
	st.setString(7, address);
	st.setString(8, email);
	st.setString(9, username);
	st.executeUpdate();
        st.close();
        conn.close();
    }
    
    public LinkedList showSuppliers() throws SQLException {
        Connection con = DBConnect.getConn();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM user WHERE RoleID=3");
        LinkedList<String> names = new LinkedList<>();
        
        while (rs.next())
                {
                  names.add(rs.getString("name"));
                }
        
        st.close();
        con.close();
        return names;
    }
}
