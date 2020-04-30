/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import entity.Brand;
import entity.Order;
import entity.Phone;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Giang
 */
public class productDB {

    private DBContext db;
    private Connection connection;

    public productDB() {
        db = new DBContext();
        try {
            connection = db.getConnection();
        } catch (Exception e) {
        }
    }

    public ArrayList<Phone> getProdust() {
        ArrayList<Phone> list = new ArrayList<>();
        String sql = "select * from Phone";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Phone(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8),rs.getString(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public ArrayList<Brand> getBrand() {
        ArrayList<Brand> list = new ArrayList<>();
        String sql = "select * from Brand";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Phone> getProductbyBrand(String brand) {
        ArrayList<Phone> list = new ArrayList<>();
        String sql = "select * from Phone where brand = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, brand);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Phone(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8),rs.getString(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
     public ArrayList<Phone> getProductbyStatus(String status) {
        ArrayList<Phone> list = new ArrayList<>();
        String sql = "select * from Phone where status =?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Phone(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8),rs.getString(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Phone> getProductbyCountry(String country) {
        ArrayList<Phone> list = new ArrayList<>();
        String sql = "Select * from Phone inner join Brand\n" +
                    "on Phone.Brand = Brand.BrandID\n" +
                    "where Brand.Made = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, country);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Phone(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8),rs.getString(9)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean exsittedProduct(String id) {
        String sql = " select * from Phone where id=?";
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

    public void insert(Phone p) {
        String sql = "INSERT INTO [Phone]\n"
                + "           ([ID]\n"
                + "           ,[Name]\n"
                + "           ,[Brand]\n"
                + "           ,[img]\n"
                + "           ,[price]\n"
                + "           ,[quantity]\n"
                + "           ,[status]\n"
                + "           ,[addDate]\n"
                + "           ,[describe])"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, p.getID());
            statement.setString(2, p.getName());
            statement.setString(3, p.getBrand());
            statement.setString(4, p.getImg());
            statement.setDouble(5, p.getPrice());
            statement.setInt(6, p.getQuantity());
            statement.setString(7, p.getStatus());
            statement.setString(8, p.getAddDate());
             statement.setString(9, p.getDescribe());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean delete(String ID) {
        boolean check = false;
        String sql = "DELETE FROM [Phone]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, ID);
            check = true;
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public Phone getProductById(String id) {
        Phone p = new Phone();
        String sql = "select * from Phone where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                p.setID(rs.getString(1));
                p.setName(rs.getString(2));
                p.setBrand(rs.getString(3));
                p.setImg(rs.getString(4));
                p.setPrice(rs.getInt(5));
                p.setQuantity(rs.getInt(6));
                p.setStatus(rs.getString(7));
                p.setAddDate(rs.getString(8));
                p.setDescribe(rs.getString(9));
            }

        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public boolean Update(Phone p) {
        boolean check = false;
        String sql = "UPDATE [Phone]\n"
                + "   SET [Name] = ?\n"
                + "      ,[Brand] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[addDate] = ?\n"
                + "      ,[describe] = ?\n"
                + " WHERE ID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, p.getName());
            statement.setString(2, p.getBrand());
            statement.setString(3, p.getImg());
            statement.setDouble(4, p.getPrice());
            statement.setInt(5, p.getQuantity());
            statement.setString(6, p.getStatus());
            statement.setString(7, p.getAddDate());
            statement.setString(8, p.getDescribe());
            statement.setString(9, p.getID());

            check = true;
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }
//
//    public ArrayList<Phone> getProdustbyID(String id) {
//        ArrayList<Phone> list = new ArrayList<>();
//        String sql = "select products.ID ,products.name,products.cat_ID,products.image,products.price,products.quantity,products.describe,products.status,products.adddate from Categories, products where Categories.ID = products.cat_ID and Categories.ID = ?";
//        try {
//            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setString(1, id);
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                list.add(new Phone(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
      public ArrayList<Phone> getProdustDealsS() {
        ArrayList<Phone> list = new ArrayList<>();
        String sql = "select * from Phone inner join PhoneDeal \n" +
            "on Phone.ID = PhoneDeal.PhoneID";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
             list.add(new Phone(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8),rs.getString(9)));

            }
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     public int getDiscount(String id) {
        
        String sql = "SELECT discount FROM PhoneDeal where PhoneID=? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("discount");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return 0;
       
    }
     public void insertOrder(Order p) {
        String sql = "INSERT INTO [dbo].[Orders]\n" +
"           ([cusID]\n" +
"           ,[orderID]\n" +
"           ,[productID]\n" +
"           ,[quantity]\n" +
"           ,[totalPrice])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, p.getCustomerID());
            statement.setString(2, p.getId());
            statement.setString(3, p.getPhoneID());
            statement.setInt(4, p.getQuantity());
            statement.setInt(5, p.getPrice());
            
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     public ArrayList<Order> getOrders() {
        ArrayList<Order> list = new ArrayList<>();
        String sql = "select * from Orders";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Phone.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
     }
}
