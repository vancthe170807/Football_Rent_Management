/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vanct
 */
public class Product {
    private String ProductCode;
    private String ProductName;
    private int ProductPrice;
    private String image;
    private int Quantities;

    public Product() {
    }

    public Product(String ProductCode, String ProductName, int ProductPrice, String image, int Quantities) {
        this.ProductCode = ProductCode;
        this.ProductName = ProductName;
        this.ProductPrice = ProductPrice;
        this.image = image;
        this.Quantities = Quantities;
    }

    public String getProductCode() {
        return ProductCode;
    }

    public void setProductCode(String ProductCode) {
        this.ProductCode = ProductCode;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public int getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(int ProductPrice) {
        this.ProductPrice = ProductPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantities() {
        return Quantities;
    }

    public void setQuantities(int Quantities) {
        this.Quantities = Quantities;
    }
    
    
}
