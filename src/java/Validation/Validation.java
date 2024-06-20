/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validation;

/**
 *
 * @author vanct
 */
public class Validation {
    // Kiểm tra và trả về một tên hợp lệ (3-30 ký tự)
    public static boolean isValidName(String name) {
        // Allow letters (including accented letters) and spaces, between 1 and 30 characters
        return name.matches("[\\p{L} ]{1,30}");
    }
    
    // Kiểm tra và trả về một số điện thoại hợp lệ (10 - 15 ký tự)
    public static boolean isValidPhoneNumber(String phoneNumber) {
        return phoneNumber.matches("\\d{10,15}");
    }
    
    // Kiểm tra và trả về một password hợp lệ (8-20 ký tự)
    public static boolean isValidPassword(String password) {
        return password.length() >= 8 && password.length() <= 20;
    }
    
    // Kiểm tra và trả về một địa chỉ email hợp lệ, có thể rỗng
    public static boolean isValidEmail(String email) {
        return email.isEmpty() || email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}");
    }

}
