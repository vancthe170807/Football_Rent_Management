/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vanct
 */
public class Equipment {
    private String EquipmentCode;
    private String EquipmentName;
    private int RentPrice;
    private String Description;
    private String image;
    private int Quantities;

    public Equipment() {
    }

    public Equipment(String EquipmentCode, String EquipmentName, int RentPrice, String Description, String image, int Quantities) {
        this.EquipmentCode = EquipmentCode;
        this.EquipmentName = EquipmentName;
        this.RentPrice = RentPrice;
        this.Description = Description;
        this.image = image;
        this.Quantities = Quantities;
    }

    public String getEquipmentCode() {
        return EquipmentCode;
    }

    public void setEquipmentCode(String EquipmentCode) {
        this.EquipmentCode = EquipmentCode;
    }

    public String getEquipmentName() {
        return EquipmentName;
    }

    public void setEquipmentName(String EquipmentName) {
        this.EquipmentName = EquipmentName;
    }

    public int getRentPrice() {
        return RentPrice;
    }

    public void setRentPrice(int RentPrice) {
        this.RentPrice = RentPrice;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
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
