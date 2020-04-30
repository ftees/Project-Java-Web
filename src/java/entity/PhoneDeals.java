/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Giang
 */
public class PhoneDeals {

    private String phoneID;
    private int discount;

    public PhoneDeals() {
    }

    public PhoneDeals(String phoneID, int discount) {
        this.phoneID = phoneID;
        this.discount = discount;
    }

    public String getPhoneID() {
        return phoneID;
    }

    public void setPhoneID(String phoneID) {
        this.phoneID = phoneID;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

   
    

}