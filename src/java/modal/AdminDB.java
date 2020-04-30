/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import entity.Admin;
import entity.Customer;
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
public class AdminDB {
     DBContext db;
     Connection connection;

    public AdminDB() {
        db = new DBContext();
         try {
             connection = db.getConnection();
         } catch (Exception ex) {
             Logger.getLogger(AdminDB.class.getName()).log(Level.SEVERE, null, ex);
         }
    }
    public Admin getAdmin(String name,String pass){
        Admin a= null;
        String sql = "Select * from Admin where username=? and password=?";
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                a = new Admin(name, pass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDB.class.getName()).log(Level.SEVERE, null, ex);
        }
       return a;
    }
     
}
