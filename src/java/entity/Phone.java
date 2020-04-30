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
public class Phone {

    private String ID, name, brand, img;
    private int price;
    private int quantity;
    private String status;
    private String addDate;
    private String describe;

    public Phone() {
    }

    public Phone(String ID, String name, String brand, String img, int price, int quantity, String status, String addDate, String describe) {
        this.ID = ID;
        this.name = name;
        this.brand = brand;
        this.img = img;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.addDate = addDate;
        this.describe = describe;
    }

   
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getAddDate() {
        return addDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setAddDate(String addDate) {
        this.addDate = addDate;
    }

    @Override
    public String toString() {
        return "Phone{" + "ID=" + ID + ", name=" + name + ", brand=" + brand + ", img=" + img + ", price=" + price + ", quantity=" + quantity + ", describe=" + describe + ", addDate=" + addDate + '}';
    }

}
