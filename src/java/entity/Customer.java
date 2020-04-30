/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author TienNp
 */
public class Customer {

    String cusID, username, password, email, phoneNumber;

    public Customer() {
    }

    public Customer(String cusID, String username, String password, String email, String phoneNumber) {
        this.cusID = cusID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public String getCusID() {
        return cusID;
    }

    public void setCusID(String cusID) {
        this.cusID = cusID;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "Customer{" + "cusID=" + cusID + ", username=" + username + ", password=" + password + ", email=" + email + ", phoneNumber=" + phoneNumber + '}';
    }

}
