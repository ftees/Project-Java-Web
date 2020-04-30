/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import entity.Customer;
import entity.Phone;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TienNp
 */
public class CustomerDB {
     DBContext db;
     Connection connection;

    public CustomerDB() {
         db = new DBContext();
        try {
            connection = db.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(CustomerDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public Customer getCustomer(String name,String pass){
        Customer a= null;
        String sql = "Select * from Customer where CusID=? and password=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                a = new Customer(name,rs.getString(2), pass, rs.getString(3),rs.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDB.class.getName()).log(Level.SEVERE, null, ex);
        }
       return a;
    }
     
    public boolean exsittedCustomer(String id) {
        String sql = " select * from Customer where Cusid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void insertCustomer(Customer c){
        String sql ="INSERT INTO [dbo].[Customer]\n" +
"           ([CusID]\n" +
"           ,[Usename]\n" +
"           ,[Password]\n" +
"           ,[Gmail]\n" +
"           ,[PhoneNumber])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
         try {
             PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCusID());
            st.setString(2, c.getUsername());
            st.setString(3, c.getPassword());
            st.setString(4, c.getEmail());
            st.setString(5, c.getPhoneNumber());
            st.executeUpdate();
         } catch (SQLException ex) {
             Logger.getLogger(CustomerDB.class.getName()).log(Level.SEVERE, null, ex);
         }
        
    }
}
