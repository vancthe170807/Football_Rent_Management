/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author chuth
 */
public class Account {
    private String fullname;
    private String phone;
    private String email;
    private String password;
    private String rolecode;

    public Account() {
    }

    // Login
    public Account(String phone, String password) {
        this.phone = phone;
        this.password = password;
    }
    
    //Register

    public Account(String fullname, String phone, String email, String password) {
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }
    
    //All

    public Account(String fullname, String phone, String email, String password, String rolecode) {
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.rolecode = rolecode;
    }

    public String getRolecode() {
        return rolecode;
    }

    public void setRolecode(String rolecode) {
        this.rolecode = rolecode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
