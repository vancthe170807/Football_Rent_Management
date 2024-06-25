/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vanct
 */
public class Field {
    private String FieldCode;
    private String FieldName;
    private int FieldType;
    private int RentPrice;
    private String Description;
    private String image;

    public Field() {
    }

    // Hiển thị thông tin chi tiết sân
    public Field(String FieldCode, String FieldName, int FieldType, int RentPrice, String image, String Description) {
        this.FieldCode = FieldCode;
        this.FieldName = FieldName;
        this.FieldType = FieldType;
        this.RentPrice = RentPrice;
        this.image = image;
        this.Description = Description;
    }

    // Hiển thị thông tin sân
    public Field(String FieldCode, String FieldName, int FieldType, int RentPrice, String image) {
        this.FieldCode = FieldCode;
        this.FieldName = FieldName;
        this.FieldType = FieldType;
        this.RentPrice = RentPrice;
        this.image = image;
    }

    public String getFieldCode() {
        return FieldCode;
    }

    public void setFieldCode(String FieldCode) {
        this.FieldCode = FieldCode;
    }

    public String getFieldName() {
        return FieldName;
    }

    public void setFieldName(String FieldName) {
        this.FieldName = FieldName;
    }

    public int getFieldType() {
        return FieldType;
    }

    public void setFieldType(int FieldType) {
        this.FieldType = FieldType;
    }

    public int getRentPrice() {
        return RentPrice;
    }

    public void setRentPrice(int RentPrice) {
        this.RentPrice = RentPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
    
}
